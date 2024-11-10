import '../controller/enter_location_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EnterLocationScreen.
///
/// This class ensures that the EnterLocationController is created when the
/// EnterLocationScreen is first loaded.
class EnterLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterLocationController());
  }
}
