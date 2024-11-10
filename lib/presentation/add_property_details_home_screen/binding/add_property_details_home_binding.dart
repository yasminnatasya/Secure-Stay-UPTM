import '../controller/add_property_details_home_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddPropertyDetailsHomeScreen.
///
/// This class ensures that the AddPropertyDetailsHomeController is created when the
/// AddPropertyDetailsHomeScreen is first loaded.
class AddPropertyDetailsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPropertyDetailsHomeController());
  }
}
