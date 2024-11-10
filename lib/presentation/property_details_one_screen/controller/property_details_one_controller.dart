import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the PropertyDetailsOneScreen.
///
/// This class manages the state of the PropertyDetailsOneScreen, including the
/// current propertyDetailsOneModelObj
class PropertyDetailsOneController extends GetxController {
  TextEditingController elevenController = TextEditingController();

// Rx<PropertyDetailsOneModel> propertyDetailsOneModelObj = PropertyDetailsOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    elevenController.dispose();
  }
}
