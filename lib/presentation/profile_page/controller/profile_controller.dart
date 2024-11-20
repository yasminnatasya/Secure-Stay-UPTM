import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/profile_page/models/profile_model.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart'; // Import the encryption helper

/// A controller class for the ProfilePage.
class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);

  TextEditingController profileEditText1Controller = TextEditingController();
  TextEditingController profileEditText2Controller = TextEditingController();
  TextEditingController profileEditText3Controller = TextEditingController();
  TextEditingController profileEditText4Controller = TextEditingController();
  TextEditingController profileEditText5Controller = TextEditingController();

  Rx<ProfileModel> profileModelObj;

  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final userDoc =
            await _firestore.collection('users').doc(currentUser.uid).get();
        if (userDoc.exists) {
          final userData = userDoc.data()!;

          // Decrypt fields
          String decryptedName =
              EncryptionHelper.decrypt(userData['name'] ?? '');
          String decryptedEmail =
              EncryptionHelper.decrypt(userData['email'] ?? '');
          String decryptedStudentId =
              EncryptionHelper.decrypt(userData['studentId'] ?? '');
          bool displayEmail =
              userData['displayEmail'] ?? true; // Default to true

          // Log decrypted values to confirm
          print("Decrypted Name: $decryptedName");
          print("Decrypted Email: $decryptedEmail");
          print("Decrypted Student ID: $decryptedStudentId");

          // If decryption failed, the method returns 'Error decrypting data'
          if (decryptedName == 'Error decrypting data' ||
              decryptedEmail == 'Error decrypting data' ||
              decryptedStudentId == 'Error decrypting data') {
            print("Decryption failed for one or more fields.");
            return;
          }

          // Update the profile model with decrypted data
          profileModelObj.value = ProfileModel(
            name: decryptedName,
            email: decryptedEmail,
            studentId: decryptedStudentId,
            displayEmail: displayEmail,
          );

          // Set TextEditingControllers with decrypted data
          profileEditText1Controller.text = decryptedName;
          profileEditText2Controller.text = decryptedEmail;
          profileEditText3Controller.text = decryptedStudentId;
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
    profileEditText1Controller.dispose();
    profileEditText2Controller.dispose();
    profileEditText3Controller.dispose();
    profileEditText4Controller.dispose();
    profileEditText5Controller.dispose();
  }
}
