import '../controller/booking_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BookingDetailsScreen.
///
/// This class ensures that the BookingDetailsController is created when the
/// BookingDetailsScreen is first loaded.
class BookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingDetailsController());
  }
}
