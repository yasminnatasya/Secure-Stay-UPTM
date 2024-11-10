import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/hobbies_screen/models/frame1_item_model.dart';
import 'package:uptm_secure_stay/presentation/hobbies_screen/models/frame3_item_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the HobbiesScreen.
///
/// This class manages the state of the HobbiesScreen, including the
/// current hobbiesModelObj
class HobbiesController extends GetxController {
  TextEditingController searchController = TextEditingController();

  //Rx<HobbiesModel> hobbiesModelObj = HobbiesModel().obs;
  RxBool isSelectCreative = false.obs;
  RxBool isSelectActivity = false.obs;

  void selectCreativeMethod(int index) {
    listFrame1ItemModelDetail[index].isSelectCreative == true
        ? listFrame1ItemModelDetail[index].isSelectCreative = false
        : listFrame1ItemModelDetail[index].isSelectCreative = true;
    update();
  }

  void selectActivityMethod(int index) {
    listFrame3ItemModelDetail[index].isSelectActivity == true
        ? listFrame3ItemModelDetail[index].isSelectActivity = false
        : listFrame3ItemModelDetail[index].isSelectActivity = true;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
