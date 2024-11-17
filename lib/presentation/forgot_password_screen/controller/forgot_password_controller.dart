import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:uptm_secure_stay/routes/app_routes.dart'; // Ensure your routes are imported

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  Future<void> sendPasswordResetEmail() async {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email address.");
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent to $email.");

      // Navigate to the login screen after showing the success message
      Future.delayed(Duration(seconds: 2), () {
        Get.offNamed(AppRoutes
            .logInActiveScreen); // Replace with the correct login route
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to send password reset email: $e");
    }
  }
}
