import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_property_details_for_roommate_screen/models/add_property_details_for_roommate_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uptm_secure_stay/presentation/property_add_success_dialog/property_add_success_dialog.dart';
import 'package:image/image.dart' as img;

class AddPropertyDetailsForRoommateController extends GetxController {
  TextEditingController fieldLableController = TextEditingController();
  TextEditingController placeholderController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController bathsController = TextEditingController();
  TextEditingController sQFTController = TextEditingController();
  TextEditingController monthlyRentController = TextEditingController();
  TextEditingController depositController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Rx<AddPropertyDetailsForRoommateModel> addPropertyDetailsForRoommateModelObj =
      AddPropertyDetailsForRoommateModel().obs;

  Rx<bool> wifi = false.obs;
  Rx<bool> elevator = false.obs;
  Rx<bool> furniture = false.obs;
  Rx<bool> generator = false.obs;
  Rx<bool> airCondition = false.obs;
  Rx<bool> students = false.obs;
  Rx<bool> male = false.obs;
  Rx<bool> petLover = false.obs;
  Rx<bool> vegetarian = false.obs;
  Rx<bool> nonsmoker = false.obs;

  RxList<String?> selectedImagePaths = <String?>[].obs;
  final ImagePicker _imagePicker = ImagePicker();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  RxInt currentFormStage = 1.obs;

  @override
  void onClose() {
    super.onClose();
    fieldLableController.dispose();
    placeholderController.dispose();
    bedController.dispose();
    bathsController.dispose();
    sQFTController.dispose();
    monthlyRentController.dispose();
    depositController.dispose();
    dateController.dispose();
    timeController.dispose();
    addressController.dispose();
  }

  void resetForm() {
    // Clear all text fields
    fieldLableController.clear();
    placeholderController.clear();
    bedController.clear();
    bathsController.clear();
    sQFTController.clear();
    monthlyRentController.clear();
    depositController.clear();
    dateController.clear();
    timeController.clear();

    // Reset all toggle values to default (false)
    wifi.value = false;
    elevator.value = false;
    furniture.value = false;
    generator.value = false;
    airCondition.value = false;
    students.value = false;
    male.value = false;
    petLover.value = false;
    vegetarian.value = false;
    nonsmoker.value = false;

    // Clear selected image paths and reset form stage
    selectedImagePaths.clear(); // Reset multiple images list
    currentFormStage.value = 1;
  }

  Future<File> compressImage(File file) async {
    final image = img.decodeImage(file.readAsBytesSync());
    final compressedImage =
        img.encodeJpg(image!, quality: 70); // Adjust quality as needed
    final compressedFile = File(file.path)..writeAsBytesSync(compressedImage);
    return compressedFile;
  }

  Future<void> pickImage() async {
    try {
      final pickedFiles =
          await _imagePicker.pickMultiImage(); // Allows multiple images
      if (pickedFiles != null) {
        selectedImagePaths.clear(); // Clear previous selections
        selectedImagePaths.addAll(pickedFiles.map((file) => file.path));
      }
    } catch (e) {
      print('Error picking images: $e');
      Get.snackbar('Error', 'Failed to pick images');
    }
  }

  Future<List<String?>> uploadImages(List<File> imageFiles) async {
    List<String?> imageUrls = [];
    try {
      final userId = _auth.currentUser?.uid ?? '';
      for (File imageFile in imageFiles) {
        final storageRef = _storage.ref().child(
            'accommodations/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg');

        final compressedImage = await compressImage(imageFile);
        final uploadTask = await storageRef.putFile(compressedImage);
        final imageUrl = await uploadTask.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      }
      return imageUrls;
    } catch (e) {
      Get.snackbar('Upload Failed', 'Failed to upload images');
      return [];
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    try {
      final userId = _auth.currentUser?.uid ?? '';
      final storageRef = _storage.ref().child(
          'accommodations/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Compress the image
      final compressedImage = await compressImage(imageFile);

      // Start the upload
      final uploadTask = await storageRef.putFile(compressedImage);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Upload Failed', 'Failed to upload image');
      return null;
    }
  }

  Future<void> savePropertyDetails() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        Get.snackbar('Error', 'User not logged in');
        return;
      }

      if (currentFormStage.value == 1) {
        currentFormStage.value = 2;
        return;
      } else if (currentFormStage.value == 2) {
        List<String?> imageUrls = [];
        if (selectedImagePaths.isNotEmpty) {
          final imageFiles =
              selectedImagePaths.map((path) => File(path!)).toList();
          imageUrls = await uploadImages(imageFiles);
          if (imageUrls.isEmpty) {
            Get.snackbar('Error', 'Image upload failed, please try again');
            return;
          }
        }

        // Property data including multiple image URLs
        Map<String, dynamic> propertyData = {
          'user_id': currentUser.uid,
          'title': fieldLableController.text.trim(),
          'description': placeholderController.text
              .trim(), // Correct input for description
          'address': addressController.text.trim(), // Correct input for address
          'beds': int.tryParse(bedController.text) ?? 0,
          'baths': int.tryParse(bathsController.text) ?? 0,
          'sqft': int.tryParse(sQFTController.text) ?? 0,
          'monthly_rent': double.tryParse(monthlyRentController.text) ?? 0.0,
          'deposit': double.tryParse(depositController.text) ?? 0.0,
          'available_date': dateController.text.trim(),
          'minimum_stay': timeController.text.trim(),
          'wifi': wifi.value,
          'elevator': elevator.value,
          'furniture': furniture.value,
          'generator': generator.value,
          'air_condition': airCondition.value,
          'students': students.value,
          'male': male.value,
          'pet_lover': petLover.value,
          'vegetarian': vegetarian.value,
          'nonsmoker': nonsmoker.value,
          'image_urls': imageUrls, // Store as a list of URLs
          'created_at': Timestamp.now(),
          'is_available': true,
        };

        await _firestore.collection('accommodations').add(propertyData);
        Get.to(() => Scaffold(body: PropertyAddSuccessDialog()));
        resetForm();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save property details');
    }
  }
}
