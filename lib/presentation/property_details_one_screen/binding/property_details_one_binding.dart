import '../controller/property_details_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PropertyDetailsOneScreen.
///
/// This class ensures that the PropertyDetailsOneController is created when the
/// PropertyDetailsOneScreen is first loaded.
class PropertyDetailsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyDetailsOneController());
  }
}
