import '../controller/add_property_details_home_filled_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddPropertyDetailsHomeFilledScreen.
///
/// This class ensures that the AddPropertyDetailsHomeFilledController is created when the
/// AddPropertyDetailsHomeFilledScreen is first loaded.
class AddPropertyDetailsHomeFilledBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPropertyDetailsHomeFilledController());
  }
}
