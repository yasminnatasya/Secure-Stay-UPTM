import '../controller/videocall_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VideocallDetailsScreen.
///
/// This class ensures that the VideocallDetailsController is created when the
/// VideocallDetailsScreen is first loaded.
class VideocallDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideocallDetailsController());
  }
}
