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
  Rx<bool> isLoading = false.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    try {
      isLoading.value = true;

      String email = emailFieldController.text.trim();
      String password = passwordFieldController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'Email and password cannot be empty');
        isLoading.value = false;
        return;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        print('Login successful, UID: ${userCredential.user!.uid}');
        isLoading.value = false;
        Get.toNamed(AppRoutes.homeScreenContainerScreen);
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;

      // Debug print to check exact error code
      print('FirebaseAuthException code: ${e.code}');

      String errorMessage;

      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'user-disabled':
          errorMessage = 'This user has been disabled.';
          break;
        case 'user-not-found':
          errorMessage = 'No user found for this email.';
          break;
        case 'wrong-password':
        case 'invalid-credential': // Handle both cases as incorrect password
          errorMessage = 'Incorrect password. Please try again.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }

      Get.snackbar(
        'Login Failed',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Login Failed',
        'An error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }
}
