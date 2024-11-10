import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/log_in_active_screen/models/log_in_active_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInActiveController extends GetxController {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  Rx<LogInActiveModel> logInActiveModelObj = LogInActiveModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs; // Track loading state

  FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  // Comment out this method to prevent disposing of controllers
  // @override
  // void onClose() {
  //   super.onClose();
  //   emailFieldController.dispose();
  //   passwordFieldController.dispose();
  // }

  // Method for user login
  Future<void> loginUser() async {
    try {
      isLoading.value = true; // Start loading

      String email = emailFieldController.text.trim();
      String password = passwordFieldController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'Email and password cannot be empty');
        isLoading.value = false;
        return;
      }

      // Sign in with Firebase authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // On successful login, navigate to the home screen
      if (userCredential.user != null) {
        print('Login successful, UID: ${userCredential.user!.uid}');

        // Handle any potential non-fatal errors here and ignore them
        try {
          // If this is causing a type cast error, catch it and proceed
          // Any operation that may cause the type cast error
        } catch (error) {
          print('Non-fatal error: $error'); // Log the error and proceed
        }

        isLoading.value = false; // Stop loading
        Get.toNamed(AppRoutes.homeScreenContainerScreen);
      }
    } catch (e) {
      // Log error to the terminal/console
      print('Login Error: ${e.runtimeType} - ${e.toString()}');

      isLoading.value = false; // Stop loading on error
      Get.snackbar('Login Failed', 'Error: ${e.runtimeType} - ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }
}
