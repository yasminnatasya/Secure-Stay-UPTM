import '../controller/basic_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BasicDetailsScreen.
///
/// This class ensures that the BasicDetailsController is created when the
/// BasicDetailsScreen is first loaded.
class BasicDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicDetailsController());
  }
}
