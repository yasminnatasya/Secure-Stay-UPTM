import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_otp/email_otp.dart';
import 'package:uptm_secure_stay/presentation/log_in_active_screen/controller/log_in_active_controller.dart';
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

      // Validate the OTP
      if (enteredOtp.isEmpty) {
        Get.snackbar('Error', 'OTP cannot be empty.');
        return;
      }

      bool isValid = await EmailOTP.verifyOTP(otp: enteredOtp);

      if (!isValid) {
        attemptCount++;
        Get.snackbar('Error', 'Incorrect OTP. Please try again.');
        return;
      }

      // Extract userId
      final userId = userInfo['userId'];
      if (userId == null || userId.isEmpty) {
        Get.snackbar('Error', 'Invalid user information.');
        return;
      }

      // Reference to the user document
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);

      // Check if the document exists
      DocumentSnapshot userDoc = await userDocRef.get();

      if (userDoc.exists) {
        // Update only the `is_verified` field
        await userDocRef.update({
          'is_verified': true,
          'updated_at': Timestamp.now(),
        });
        print('User verification status updated successfully.');
      } else {
        // Create a new user record if it doesn't exist
        await userDocRef.set({
          'name': userInfo['fullName'] ?? 'N/A',
          'email': userInfo['email'] ?? 'N/A',
          'student_id': userInfo['studentId'] ?? 'N/A',
          'is_verified': true,
          'user_id': userId,
          'is_international_student':
              userInfo['isInternationalStudent'] ?? false,
          'created_at': Timestamp.now(),
          'updated_at': Timestamp.now(),
        });
        print('New user record created successfully.');
      }

      // Show success dialog
      Get.defaultDialog(
        title: 'Verification Successful',
        middleText: 'Your verification has been completed successfully.',
        confirm: ElevatedButton(
          onPressed: () {
            Get.back(); // Close the dialog
            Get.toNamed(AppRoutes.logInActiveScreen)?.then((_) {
              // Reset login state when returning to login page
              final logInActiveController = Get.find<LogInActiveController>();
              logInActiveController.resetLoginState();
            });
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        ),
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
