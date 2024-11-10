import '../controller/identity_controller.dart';
import 'package:get/get.dart';

/// A binding class for the IdentityScreen.
///
/// This class ensures that the IdentityController is created when the
/// IdentityScreen is first loaded.
class IdentityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IdentityController());
  }
}
