import '../controller/property_details_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PropertyDetailsTwoScreen.
///
/// This class ensures that the PropertyDetailsTwoController is created when the
/// PropertyDetailsTwoScreen is first loaded.
class PropertyDetailsTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyDetailsTwoController());
  }
}
