import '../controller/populr_property_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PopulrPropertyScreen.
///
/// This class ensures that the PopulrPropertyController is created when the
/// PopulrPropertyScreen is first loaded.
class PopulrPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopulrPropertyController());
  }
}
