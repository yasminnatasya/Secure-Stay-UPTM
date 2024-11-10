import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_property_details_home_filled_screen/models/add_property_details_home_filled_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddPropertyDetailsHomeFilledScreen.
///
/// This class manages the state of the AddPropertyDetailsHomeFilledScreen, including the
/// current addPropertyDetailsHomeFilledModelObj
class AddPropertyDetailsHomeFilledController extends GetxController {
  TextEditingController fieldlableController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController inputBoxController = TextEditingController();

  TextEditingController inputBoxController1 = TextEditingController();

  TextEditingController durationController = TextEditingController();

  Rx<AddPropertyDetailsHomeFilledModel> addPropertyDetailsHomeFilledModelObj =
      AddPropertyDetailsHomeFilledModel().obs;

  Rx<bool> beds = false.obs;

  Rx<bool> baths = false.obs;

  @override
  void onClose() {
    super.onClose();
    fieldlableController.dispose();
    descriptionController.dispose();
    inputBoxController.dispose();
    inputBoxController1.dispose();
    durationController.dispose();
  }
}
