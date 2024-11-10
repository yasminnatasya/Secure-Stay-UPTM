import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/identity_screen/models/identity_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the IdentityScreen.
///
/// This class manages the state of the IdentityScreen, including the
/// current identityModelObj
class IdentityController extends GetxController {
  TextEditingController inputBoxController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController inputBoxController1 = TextEditingController();

  TextEditingController countryController = TextEditingController();

  Rx<IdentityModel> identityModelObj = IdentityModel().obs;

  @override
  void onClose() {
    super.onClose();
    inputBoxController.dispose();
    priceController.dispose();
    addressController.dispose();
    cityController.dispose();
    inputBoxController1.dispose();
    countryController.dispose();
  }
}
