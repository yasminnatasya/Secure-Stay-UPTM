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

  bool detectAnomaly(Map<String, dynamic> propertyData) {
    // Define thresholds
    const int minBeds = 0;
    const int maxBeds = 20;
    const int minBaths = 0;
    const int maxBaths = 20;
    const int minSqft = 100;
    const int maxSqft = 10000;
    const double minRent = 100.0;
    const double maxRent = 10000.0;

    // Anomaly checks
    if (propertyData['beds'] < minBeds || propertyData['beds'] > maxBeds) {
      return true;
    }
    if (propertyData['baths'] < minBaths || propertyData['baths'] > maxBaths) {
      return true;
    }
    if (propertyData['sqft'] < minSqft || propertyData['sqft'] > maxSqft) {
      return true;
    }
    if (propertyData['monthly_rent'] < minRent ||
        propertyData['monthly_rent'] > maxRent) {
      return true;
    }

    return false; // No anomaly detected
  }

  bool _areAllFieldsFilled() {
    print("Title: ${fieldLableController.text.trim()}");
    print("Description: ${placeholderController.text.trim()}");
    print("Address: ${addressController.text.trim()}");
    print("Beds: ${bedController.text.trim()}");
    print("Baths: ${bathsController.text.trim()}");
    print("SQFT: ${sQFTController.text.trim()}");
    print("Monthly Rent: ${monthlyRentController.text.trim()}");
    print("Deposit: ${depositController.text.trim()}");
    print("Available Date: ${dateController.text.trim()}");
    print("Minimum Stay: ${timeController.text.trim()}");

    return fieldLableController.text.trim().isNotEmpty &&
        placeholderController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty &&
        bedController.text.trim().isNotEmpty &&
        bathsController.text.trim().isNotEmpty &&
        sQFTController.text.trim().isNotEmpty &&
        monthlyRentController.text.trim().isNotEmpty &&
        depositController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty &&
        timeController.text.trim().isNotEmpty;
  }

  bool _areStageOneFieldsFilled() {
    return fieldLableController.text.trim().isNotEmpty &&
        placeholderController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty &&
        bedController.text.trim().isNotEmpty &&
        bathsController.text.trim().isNotEmpty &&
        sQFTController.text.trim().isNotEmpty &&
        monthlyRentController.text.trim().isNotEmpty &&
        depositController.text.trim().isNotEmpty;
  }

  bool _areStageTwoFieldsFilled() {
    return dateController.text.trim().isNotEmpty &&
        timeController.text.trim().isNotEmpty;
  }

  bool isValidImage(File file) {
    final validExtensions = ['jpg', 'jpeg', 'png', 'bmp'];
    final fileExtension = file.path.split('.').last.toLowerCase();

    if (!validExtensions.contains(fileExtension)) {
      print("Invalid file extension: $fileExtension");
      return false;
    }

    try {
      final mimeType = file.readAsBytesSync().take(4).toList();
      const jpgMagicNumbers = [0xFF, 0xD8, 0xFF];
      const pngMagicNumbers = [0x89, 0x50, 0x4E, 0x47];

      if (mimeType.length >= jpgMagicNumbers.length &&
          List.generate(jpgMagicNumbers.length,
                  (index) => mimeType[index] == jpgMagicNumbers[index])
              .every((match) => match)) {
        return true;
      }

      if (mimeType.length >= pngMagicNumbers.length &&
          List.generate(pngMagicNumbers.length,
                  (index) => mimeType[index] == pngMagicNumbers[index])
              .every((match) => match)) {
        return true;
      }
    } catch (e) {
      print("Error validating image file: $e");
      return false;
    }

    return false;
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
        if (!isValidImage(imageFile)) {
          Get.snackbar('Error', 'Invalid image file detected. Please retry.');
          continue;
        }

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

      // Validate fields based on the current stage
      if (currentFormStage.value == 1) {
        if (!_areStageOneFieldsFilled()) {
          Get.snackbar(
            'Error',
            'All required fields for Stage 1 must be filled. Please check your input.',
          );
          return;
        }

        // Proceed to the next form stage
        currentFormStage.value = 2;
        return;
      } else if (currentFormStage.value == 2) {
        if (!_areStageTwoFieldsFilled()) {
          Get.snackbar(
            'Error',
            'All required fields for Stage 2 must be filled. Please check your input.',
          );
          return;
        }

        // Validate and filter images
        List<File> validImageFiles = [];
        if (selectedImagePaths.isNotEmpty) {
          validImageFiles = selectedImagePaths
              .map((path) => File(path!))
              .where((file) => isValidImage(file))
              .toList();

          if (validImageFiles.isEmpty) {
            Get.snackbar('Error', 'Please upload valid image files only.');
            return;
          }
        } else {
          Get.snackbar('Error', 'At least one image is required.');
          return;
        }

        // Upload images
        List<String?> imageUrls = await uploadImages(validImageFiles);
        if (imageUrls.isEmpty) {
          Get.snackbar('Error', 'Image upload failed, please try again.');
          return;
        }

        // Property data
        Map<String, dynamic> propertyData = {
          'user_id': currentUser.uid,
          'title': fieldLableController.text.trim(),
          'description': placeholderController.text.trim(),
          'address': addressController.text.trim(),
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
          'image_urls': imageUrls,
          'created_at': Timestamp.now(),
          'is_available': true,
        };

        // Anomaly detection
        if (detectAnomaly(propertyData)) {
          Get.snackbar(
            'Warning',
            'Anomaly detected in the property details. Please review your input.',
          );
          return;
        }

        // Save property details to Firestore
        await _firestore.collection('accommodations').add(propertyData);
        Get.to(() => Scaffold(body: PropertyAddSuccessDialog()));
        resetForm();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save property details');
    }
  }
}
