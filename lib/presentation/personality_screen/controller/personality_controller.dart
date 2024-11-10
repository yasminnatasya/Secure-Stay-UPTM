import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/personality_screen/models/chipview_item_model.dart';
import 'package:uptm_secure_stay/presentation/personality_screen/models/personality_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PersonalityScreen.
///
/// This class manages the state of the PersonalityScreen, including the
/// current personalityModelObj
class PersonalityController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxBool isSelect = false.obs;

  void selectItemMethod(int index) {
    listChipViewItemModelDetail[index].isSelected == true
        ? listChipViewItemModelDetail[index].isSelected = false
        : listChipViewItemModelDetail[index].isSelected = true;
    update();
  }

  Rx<PersonalityModel> personalityModelObj = PersonalityModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
