import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/settings_screen/models/settings_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current settingsModelObj
class SettingsController extends GetxController {
  TextEditingController profileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  bool _isDisposed = false;

  @override
  void onClose() {
    if (!_isDisposed) {
      profileController.dispose();
      addressController.dispose();
      _isDisposed = true; // Mark as disposed to avoid errors.
    }
    super.onClose();
  }
}
