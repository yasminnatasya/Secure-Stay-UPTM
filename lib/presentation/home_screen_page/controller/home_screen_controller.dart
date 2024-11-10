import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the HomeScreenPage.
///
/// This class manages the state of the HomeScreenPage, including the
/// current homeScreenModelObj
class HomeScreenController extends GetxController {
  //HomeScreenController(this.homeScreenModelObj);

  TextEditingController searchController = TextEditingController();
  TextEditingController searchRentController = TextEditingController();

  Rx<bool> bed = false.obs;

  Rx<bool> bath = false.obs;

  Rx<bool> bed1 = false.obs;

  Rx<bool> bath1 = false.obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
