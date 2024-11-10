import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/home_screen_container_screen/models/home_screen_container_model.dart';

/// A controller class for the HomeScreenContainerScreen.
///
/// This class manages the state of the HomeScreenContainerScreen, including the
/// current homeScreenContainerModelObj
class HomeScreenContainerController extends GetxController {
  Rx<HomeScreenContainerModel> homeScreenContainerModelObj =
      HomeScreenContainerModel().obs;
  RxInt selectIndex = 0.obs;
  RxString searchQuery = ''.obs; // Added to store the search query

  void selectBottomMethod(int value) {
    selectIndex.value = value;
    update();
  }
}
