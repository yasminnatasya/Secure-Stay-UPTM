import '../controller/my_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyAddressScreen.
///
/// This class ensures that the MyAddressController is created when the
/// MyAddressScreen is first loaded.
class MyAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddressController());
  }
}
