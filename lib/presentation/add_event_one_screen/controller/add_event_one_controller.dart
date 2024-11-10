import 'package:flutter/material.dart';

/// A controller class for the AddEventOneScreen.
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_event_one_screen/models/add_event_one_model.dart';

///
/// This class manages the state of the AddEventOneScreen, including the
/// current addEventOneModelObj
class AddEventOneController extends GetxController {
  TextEditingController fieldlableController = TextEditingController();

  TextEditingController placeholderController = TextEditingController();

  TextEditingController entryPriceController = TextEditingController();

  TextEditingController inputBoxController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TextEditingController timeController1 = TextEditingController();

  Rx<AddEventOneModel> addEventOneModelObj = AddEventOneModel().obs;

  Rx<bool> music = false.obs;

  Rx<bool> newYear = false.obs;

  Rx<bool> birthday = false.obs;

  Rx<bool> religious = false.obs;

  Rx<bool> popSongs = false.obs;

  @override
  void onClose() {
    super.onClose();
    fieldlableController.dispose();
    placeholderController.dispose();
    inputBoxController.dispose();
    dateController.dispose();
    timeController.dispose();
    timeController1.dispose();
  }
}
