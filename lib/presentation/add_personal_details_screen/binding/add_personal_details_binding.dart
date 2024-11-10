import '../controller/add_personal_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddPersonalDetailsScreen.
///
/// This class ensures that the AddPersonalDetailsController is created when the
/// AddPersonalDetailsScreen is first loaded.
class AddPersonalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPersonalDetailsController());
  }
}
