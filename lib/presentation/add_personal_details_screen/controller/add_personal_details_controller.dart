import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_personal_details_screen/models/add_personal_details_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddPersonalDetailsScreen.
///
/// This class manages the state of the AddPersonalDetailsScreen, including the
/// current addPersonalDetailsModelObj
class AddPersonalDetailsController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController durationController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController occupationsController = TextEditingController();

  Rx<AddPersonalDetailsModel> addPersonalDetailsModelObj =
      AddPersonalDetailsModel().obs;

  Rx<bool> students = false.obs;

  Rx<bool> male = false.obs;

  Rx<bool> petLover = false.obs;

  Rx<bool> vegetarian = false.obs;

  Rx<bool> nonsmoker = false.obs;
  Rx<bool> football = false.obs;

  Rx<bool> music = false.obs;

  Rx<bool> gym = false.obs;

  Rx<bool> netflix = false.obs;

  Rx<bool> hockey = false.obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    durationController.dispose();
    ageController.dispose();
    occupationsController.dispose();
  }
}
