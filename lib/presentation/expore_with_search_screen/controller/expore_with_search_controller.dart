import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/expore_with_search_screen/models/expore_with_search_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ExporeWithSearchScreen.
///
/// This class manages the state of the ExporeWithSearchScreen, including the
/// current exporeWithSearchModelObj
class ExporeWithSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<ExporeWithSearchModel> exporeWithSearchModelObj =
      ExporeWithSearchModel().obs;

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
