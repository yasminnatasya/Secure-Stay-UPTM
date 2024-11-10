import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_otp/email_otp.dart';
import '../../../routes/app_routes.dart';
import '../../../../services/encryption_helper.dart'; // Corrected path

class VerificationController extends GetxController {
  Rx<TextEditingController> otpController = TextEditingController().obs;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int maxAttempts = 5;
  int attemptCount = 0;

  Future<void> verifyOtp(Map<String, dynamic> userInfo) async {
    try {
      if (attemptCount >= maxAttempts) {
        Get.snackbar('Error', 'Maximum attempts exceeded.');
        return;
      }

      String enteredOtp = otpController.value.text.trim();
      bool isValid = await EmailOTP.verifyOTP(otp: enteredOtp);

      if (!isValid) {
        attemptCount++;
        Get.snackbar('Error', 'Incorrect OTP. Please try again.');
        return;
      }

      // Encrypt sensitive fields
      final encryptedFullName = EncryptionHelper.encrypt(userInfo['fullName']);
      final encryptedEmail = EncryptionHelper.encrypt(userInfo['email']);
      final encryptedStudentId =
          EncryptionHelper.encrypt(userInfo['studentId']);

      // Insert encrypted user data if OTP is valid
      await _firestore.collection('users').doc(userInfo['userId']).set({
        'name': encryptedFullName,
        'email': encryptedEmail,
        'student_id': encryptedStudentId,
        'is_verified': true,
        'user_id': userInfo['userId'],
        'created_at': Timestamp.now(),
        'otp_expiration':
            Timestamp.fromDate(DateTime.now().add(Duration(minutes: 10))),
      });

      print('User data stored successfully in Firestore with encryption.');

      // Show success dialog
      Get.defaultDialog(
        title: 'Registration Successful',
        middleText: 'Your registration has been completed successfully.',
        confirm: ElevatedButton(
          onPressed: () {
            Get.back(); // Close the dialog
            Get.toNamed(AppRoutes.logInActiveScreen);
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        ),
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
