import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/home_screen_tab_container_page/models/home_screen_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the HomeScreenTabContainerPage.
///
/// This class manages the state of the HomeScreenTabContainerPage, including the
/// current homeScreenTabContainerModelObj
class HomeScreenTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeScreenTabContainerController(this.homeScreenTabContainerModelObj);

  Rx<HomeScreenTabContainerModel> homeScreenTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));

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
