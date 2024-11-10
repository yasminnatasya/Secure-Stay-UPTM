import '../controller/my_property_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyPropertyScreen.
///
/// This class ensures that the MyPropertyController is created when the
/// MyPropertyScreen is first loaded.
class MyPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPropertyController());
  }
}
