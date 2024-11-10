import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the PropertyDetailsScreen.
///
/// This class manages the state of the PropertyDetailsScreen, including the
/// current propertyDetailsModelObj
class PropertyDetailsController extends GetxController {
  TextEditingController elevenController = TextEditingController();

  //Rx<PropertyDetailsModel> propertyDetailsModelObj = PropertyDetailsModel().obs;

  @override
  void onClose() {
    super.onClose();
    elevenController.dispose();
  }
}
