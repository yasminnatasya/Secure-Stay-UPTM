import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/basic_details_screen/models/basic_details_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the BasicDetailsScreen.
///
/// This class manages the state of the BasicDetailsScreen, including the
/// current basicDetailsModelObj
class BasicDetailsController extends GetxController {
  TextEditingController masterUsernameFullNameController =
      TextEditingController();

  TextEditingController inputBoxController = TextEditingController();
  TextEditingController dateTime = TextEditingController();

  TextEditingController masterUsernameOccupationController =
      TextEditingController();

  Rx<BasicDetailsModel> basicDetailsModelObj = BasicDetailsModel().obs;

  @override
  void onClose() {
    super.onClose();
    masterUsernameFullNameController.dispose();
    inputBoxController.dispose();
    dateTime.dispose();
    masterUsernameOccupationController.dispose();
  }
}
