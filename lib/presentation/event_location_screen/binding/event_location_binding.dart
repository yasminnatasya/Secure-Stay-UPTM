import '../controller/event_location_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EventLocationScreen.
///
/// This class ensures that the EventLocationController is created when the
/// EventLocationScreen is first loaded.
class EventLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventLocationController());
  }
}
