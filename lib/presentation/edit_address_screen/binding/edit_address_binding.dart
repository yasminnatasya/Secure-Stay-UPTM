import '../controller/edit_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditAddressScreen.
///
/// This class ensures that the EditAddressController is created when the
/// EditAddressScreen is first loaded.
class EditAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditAddressController());
  }
}
