import '../controller/add_property_details_for_roommate_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddPropertyDetailsForRoommateScreen.
///
/// This class ensures that the AddPropertyDetailsForRoommateController is created when the
/// AddPropertyDetailsForRoommateScreen is first loaded.
class AddPropertyDetailsForRoommateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPropertyDetailsForRoommateController());
  }
}
