import '../controller/add_property_details_home1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddPropertyDetailsHome1Screen.
///
/// This class ensures that the AddPropertyDetailsHome1Controller is created when the
/// AddPropertyDetailsHome1Screen is first loaded.
class AddPropertyDetailsHome1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPropertyDetailsHome1Controller());
  }
}
