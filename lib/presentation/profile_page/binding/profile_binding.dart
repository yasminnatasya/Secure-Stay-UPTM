import 'package:uptm_secure_stay/presentation/profile_page/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/presentation/profile_page/models/profile_model.dart';

/// A binding class for the Profile1Screen.
/// This class ensures that the Profile1Controller is created when the
/// Profile1Screen is first loaded.
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(
          ProfileModel(
            name: '', // Provide a default value for name
            email: '', // Provide a default value for email
          ).obs,
        ));
  }
}
