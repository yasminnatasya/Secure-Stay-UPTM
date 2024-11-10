import '../controller/call_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CallDetailsScreen.
///
/// This class ensures that the CallDetailsController is created when the
/// CallDetailsScreen is first loaded.
class CallDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallDetailsController());
  }
}
