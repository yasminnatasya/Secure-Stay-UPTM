import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Input Sanitization
  String sanitizeInput(String input) {
    // Remove any characters that are not alphanumeric, spaces, or standard symbols
    return input.replaceAll(RegExp(r'[^\w\s@.-]'), '');
  }

  void configureEmailOtp() {
    EmailOTP.config(
      appName: 'SecureStay UPTM',
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

  bool isValidEmailDomain(String email) {
    final allowedDomains = ['@gmail.com', '@uptm.edu.my'];
    return allowedDomains.any((domain) => email.endsWith(domain));
  }

  Future<void> signUp() async {
    try {
      if (isLoading.value) return;
      isLoading.value = true;

      // Sanitize inputs
      String email = sanitizeInput(emailController.text.trim());
      String password = sanitizeInput(passwordController.text.trim());
      String fullName = sanitizeInput(fullNameController.text.trim());
      String studentId = sanitizeInput(studentIdController.text.trim());

      if (email.isEmpty ||
          password.isEmpty ||
          fullName.isEmpty ||
          studentId.isEmpty) {
        Get.snackbar('Error', 'All fields are required');
        isLoading.value = false;
        return;
      }

      if (!isValidEmailDomain(email)) {
        Get.snackbar('Error', 'Please use a valid email domain');
        isLoading.value = false;
        return;
      }

      // Check if email already exists in the database
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (userDoc.docs.isNotEmpty) {
        final existingUser = userDoc.docs.first.data();
        if (existingUser['is_verified'] == false) {
          // Resend OTP and navigate to verification screen
          bool isOtpSent = await EmailOTP.sendOTP(email: email);
          if (!isOtpSent) {
            Get.snackbar('Error', 'Failed to resend OTP to $email');
            isLoading.value = false;
            return;
          }

          Get.toNamed(AppRoutes.verificationScreen, arguments: {
            'userId': userDoc.docs.first.id,
            'fullName': fullName,
            'email': email,
            'studentId': studentId,
          });
          isLoading.value = false;
          return;
        } else {
          // Email is already verified
          Get.snackbar('Error', 'The email address is already in use.');
          isLoading.value = false;
          return;
        }
      }

      // Proceed with account creation if email doesn't exist
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
        // Save user details with is_verified as false
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'fullName': fullName,
          'studentId': studentId,
          'is_verified': false,
          'created_at': FieldValue.serverTimestamp(),
        });

        // Send OTP
        bool isOtpSent = await EmailOTP.sendOTP(email: email);
        if (!isOtpSent) {
          Get.snackbar('Error', 'Failed to send OTP to $email');
          isLoading.value = false;
          return;
        }

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
