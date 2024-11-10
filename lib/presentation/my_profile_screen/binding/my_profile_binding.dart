import '../controller/my_profile_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyProfileScreen.
///
/// This class ensures that the MyProfileController is created when the
/// MyProfileScreen is first loaded.
class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileController());
  }
}
