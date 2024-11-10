import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_new_address_screen/models/add_new_address_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddNewAddressScreen.
///
/// This class manages the state of the AddNewAddressScreen, including the
/// current addNewAddressModelObj
class AddNewAddressController extends GetxController {
  TextEditingController addressController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController inputBoxController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  Rx<AddNewAddressModel> addNewAddressModelObj = AddNewAddressModel().obs;

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
