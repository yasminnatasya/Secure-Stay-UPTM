import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_property_details_home1_screen/models/add_property_details_home1_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddPropertyDetailsHome1Screen.
///
/// This class manages the state of the AddPropertyDetailsHome1Screen, including the
/// current addPropertyDetailsHome1ModelObj
class AddPropertyDetailsHome1Controller extends GetxController {
  TextEditingController addressController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController inputBoxController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  Rx<AddPropertyDetailsHome1Model> addPropertyDetailsHome1ModelObj =
      AddPropertyDetailsHome1Model().obs;

  @override
  void onClose() {
    super.onClose();
    addressController.dispose();
    addressController1.dispose();
    cityController.dispose();
    inputBoxController.dispose();
    countryController.dispose();
  }
}
