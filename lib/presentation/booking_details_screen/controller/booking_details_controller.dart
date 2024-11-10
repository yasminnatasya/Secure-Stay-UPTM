import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/booking_details_screen/models/booking_details_model.dart';
import 'package:table_calendar/table_calendar.dart';

/// A controller class for the BookingDetailsScreen.
///
/// This class manages the state of the BookingDetailsScreen, including the
/// current bookingDetailsModelObj
class BookingDetailsController extends GetxController {
  Rx<BookingDetailsModel> bookingDetailsModelObj = BookingDetailsModel().obs;

  DateTime? rangeStart;

  DateTime? rangeEnd;
  TimeOfDay selectTime = TimeOfDay.now();
  TimeOfDay? pickedTime;
  DateTime? selectedDay;

  Rx<DateTime> focusedDay = DateTime.now().obs;

  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;

  RxInt adultCount = 0.obs;
  RxInt childrenCount = 0.obs;

  void adultIncrement() {
    adultCount.value++;
  }

  void adultDecrement() {
    if (adultCount.value > 0) {
      adultCount.value--;
    }
  }

  void childrenIncrement() {
    childrenCount.value++;
  }

  void childrenDecrement() {
    if (childrenCount.value > 0) {
      childrenCount.value--;
    }
  }
}
