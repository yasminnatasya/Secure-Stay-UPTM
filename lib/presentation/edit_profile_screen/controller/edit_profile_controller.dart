import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
  }
}
