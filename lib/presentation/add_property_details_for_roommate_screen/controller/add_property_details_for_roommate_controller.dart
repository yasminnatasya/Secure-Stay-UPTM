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

  Rx<String?> selectedImagePath = Rx<String?>(null);
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

    // Clear selected image path and reset form stage
    selectedImagePath.value = null;
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
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
      }
    } catch (e) {
      print('Error picking image: $e');
      Get.snackbar('Error', 'Failed to pick image');
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

      // Check form stage and handle flow
      if (currentFormStage.value == 1) {
        // Assume form stage 1 data is validated and ready to proceed
        currentFormStage.value = 2;
        return;
      } else if (currentFormStage.value == 2) {
        // Only proceed to save when in the final stage
        String? imageUrl;
        if (selectedImagePath.value != null) {
          final imageFile = File(selectedImagePath.value!);
          imageUrl = await uploadImage(imageFile);
          if (imageUrl == null) {
            Get.snackbar('Error', 'Image upload failed, please try again');
            return;
          }
        }

        // Prepare property data for Firestore
        String title = fieldLableController.text.trim();
        String description = placeholderController.text.trim();
        String address = placeholderController.text.trim();
        int beds = int.tryParse(bedController.text) ?? 0;
        int baths = int.tryParse(bathsController.text) ?? 0;
        int sqft = int.tryParse(sQFTController.text) ?? 0;
        double monthlyRent = double.tryParse(monthlyRentController.text) ?? 0.0;
        double deposit = double.tryParse(depositController.text) ?? 0.0;
        String availableDate = dateController.text.trim();
        String minimumStay = timeController.text.trim();

        Map<String, dynamic> propertyData = {
          'user_id': currentUser.uid,
          'title': title,
          'description': description,
          'address': address,
          'beds': beds,
          'baths': baths,
          'sqft': sqft,
          'monthly_rent': monthlyRent,
          'deposit': deposit,
          'available_date': availableDate,
          'minimum_stay': minimumStay,
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
          'image_url': imageUrl, // Ensures image URL is added
          'created_at': Timestamp.now(),
        };

        // Save to Firestore
        await _firestore.collection('accommodations').add(propertyData);
        Get.to(() => Scaffold(body: PropertyAddSuccessDialog()));
        // Reset form for new data entry
        resetForm();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save property details');
    }
  }
}
