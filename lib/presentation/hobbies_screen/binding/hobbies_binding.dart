import '../controller/hobbies_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HobbiesScreen.
///
/// This class ensures that the HobbiesController is created when the
/// HobbiesScreen is first loaded.
class HobbiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HobbiesController());
  }
}
