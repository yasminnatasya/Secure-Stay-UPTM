import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/event_location_screen/models/event_location_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EventLocationScreen.
///
/// This class manages the state of the EventLocationScreen, including the
/// current eventLocationModelObj
class EventLocationController extends GetxController {
  TextEditingController addressController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController inputBoxController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  Rx<EventLocationModel> eventLocationModelObj = EventLocationModel().obs;

  @override
  void onClose() {
    super.onClose();
    addressController.dispose();
    addressController1.dispose();
    cityController.dispose();
    inputBoxController.dispose();
    countryController.dispose();
  }
}
