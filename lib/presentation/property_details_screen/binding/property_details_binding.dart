import '../controller/property_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PropertyDetailsScreen.
///
/// This class ensures that the PropertyDetailsController is created when the
/// PropertyDetailsScreen is first loaded.
class PropertyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyDetailsController());
  }
}
