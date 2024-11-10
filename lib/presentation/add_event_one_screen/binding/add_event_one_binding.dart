import '../controller/add_event_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddEventOneScreen.
///
/// This class ensures that the AddEventOneController is created when the
/// AddEventOneScreen is first loaded.
class AddEventOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEventOneController());
  }
}
