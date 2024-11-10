import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/reset_password_screen/models/reset_password_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ResetPasswordScreen.
///
/// This class manages the state of the ResetPasswordScreen, including the
/// current resetPasswordModelObj
class ResetPasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<ResetPasswordModel> resetPasswordModelObj = ResetPasswordModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onClose() {
    super.onClose();
    newPasswordController.dispose();
    passwordController.dispose();
  }
}
