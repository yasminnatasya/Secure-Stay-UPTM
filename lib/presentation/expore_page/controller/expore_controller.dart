import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the ExporePage.
///
/// This class manages the state of the ExporePage, including the
/// current exporeModelObj
class ExporeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxBool isSubmit = false.obs;
  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
