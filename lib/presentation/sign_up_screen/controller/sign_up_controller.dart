import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/routes/app_routes.dart';
import 'package:uptm_secure_stay/services/auth_service.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isShowPassword = true.obs;

  final AuthService _authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    configureEmailOtp();
  }

  void configureEmailOtp() {
    EmailOTP.config(
      appName: 'UPTM Secure Stay',
      otpType: OTPType.numeric,
      emailTheme: EmailTheme.v1,
    );

    EmailOTP.setSMTP(
      host: 'mail.rohitchouhan.com',
      emailPort: EmailPort.port587,
      secureType: SecureType.tls,
      username: 'noreply@email-otp.rohitchouhan.com',
      password: 'vgk!cer8xku9BQN5nhk',
    );

    EmailOTP.setTemplate(
      template: '''
      <div style="background-color: #f4f4f4; padding: 20px; font-family: Arial, sans-serif;">
        <div style="background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
          <h1 style="color: #333;">{{appName}}</h1>
          <p style="color: #333;">Your registration OTP is <strong>{{otp}}</strong></p>
          <p style="color: #333;">Please use this OTP to complete your registration. This OTP is valid for 5 minutes.</p>
          <p style="color: #333;">Thank you for using our service.</p>
        </div>
      </div>
      ''',
    );
  }

  Future<void> signUp() async {
    try {
      if (isLoading.value) return;
      isLoading.value = true;

      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String fullName = fullNameController.text.trim();
      String studentId = studentIdController.text.trim();

      if (email.isEmpty ||
          password.isEmpty ||
          fullName.isEmpty ||
          studentId.isEmpty) {
        Get.snackbar('Error', 'All fields are required');
        isLoading.value = false;
        return;
      }

      User? user;
      try {
        user = await _authService.createUserWithEmailAndPassword(
          email: email,
          password: password,
          fullName: fullName,
        );
      } catch (e) {
        String errorMessage = _getAuthErrorMessage(e.toString());
        Get.snackbar('Error', errorMessage);
        isLoading.value = false;
        return;
      }

      if (user != null) {
        bool isOtpSent = await EmailOTP.sendOTP(email: email);
        if (!isOtpSent) {
          Get.snackbar('Error', 'Failed to send OTP to $email');
          isLoading.value = false;
          return;
        }

        // Pass all required data to VerificationScreen
        Get.toNamed(AppRoutes.verificationScreen, arguments: {
          'userId': user.uid,
          'fullName': fullName,
          'email': email,
          'studentId': studentId,
        });
      }

      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }

  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }

  String _getAuthErrorMessage(String error) {
    if (error.contains('email-already-in-use')) {
      return 'The email address is already in use by another account.';
    } else if (error.contains('invalid-email')) {
      return 'The email address is not valid.';
    } else if (error.contains('weak-password')) {
      return 'The password is too weak. Please use a stronger password.';
    } else {
      return 'An unknown error occurred. Please try again.';
    }
  }
}
