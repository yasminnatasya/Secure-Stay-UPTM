import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_property_details_home_screen/models/add_property_details_home_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddPropertyDetailsHomeScreen.
///
/// This class manages the state of the AddPropertyDetailsHomeScreen, including the
/// current addPropertyDetailsHomeModelObj
class AddPropertyDetailsHomeController extends GetxController {
  TextEditingController fieldTittleController = TextEditingController();

  TextEditingController placeholderController = TextEditingController();

  TextEditingController bedController = TextEditingController();

  TextEditingController bathsController = TextEditingController();

  TextEditingController sQFTController = TextEditingController();

  TextEditingController inputBoxController = TextEditingController();

  TextEditingController inputBoxController1 = TextEditingController();

  TextEditingController monthlyRentController = TextEditingController();

  TextEditingController depositController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  Rx<AddPropertyDetailsHomeModel> addPropertyDetailsHomeModelObj =
      AddPropertyDetailsHomeModel().obs;

  Rx<bool> beds = false.obs;

  Rx<bool> baths = false.obs;

  Rx<bool> wifi = false.obs;

  Rx<bool> elevator = false.obs;

  Rx<bool> furniture = false.obs;

  Rx<bool> generator = false.obs;

  Rx<bool> airCondition = false.obs;

  @override
  void onClose() {
    super.onClose();
    fieldTittleController.dispose();
    placeholderController.dispose();
    bedController.dispose();
    bathsController.dispose();
    sQFTController.dispose();
    inputBoxController.dispose();
    inputBoxController1.dispose();
    monthlyRentController.dispose();
    depositController.dispose();
    dateController.dispose();
    timeController.dispose();
  }
}
