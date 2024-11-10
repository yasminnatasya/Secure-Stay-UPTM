import '../controller/chat_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatDetailsScreen.
///
/// This class ensures that the ChatDetailsController is created when the
/// ChatDetailsScreen is first loaded.
class ChatDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatDetailsController());
  }
}
