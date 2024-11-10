import '../controller/log_in_active_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LogInActiveScreen.
///
/// This class ensures that the LogInActiveController is created when the
/// LogInActiveScreen is first loaded.
class LogInActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInActiveController());
  }
}
