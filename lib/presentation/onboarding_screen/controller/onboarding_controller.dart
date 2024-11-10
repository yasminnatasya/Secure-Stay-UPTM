import 'package:uptm_secure_stay/core/app_export.dart';

/// A controller class for the OnboardingScreen.
///
/// This class manages the state of the OnboardingScreen, including the
/// current onboardingModelObj
class OnboardingController extends GetxController {
  //Rx<OnboardingModel> onboardingModelObj = OnboardingModel().obs;

  RxInt sliderIndex = 0.obs;
}
