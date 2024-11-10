import '../controller/reset_password_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ResetPasswordScreen.
///
/// This class ensures that the ResetPasswordController is created when the
/// ResetPasswordScreen is first loaded.
class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
