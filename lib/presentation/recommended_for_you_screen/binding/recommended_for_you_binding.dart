import '../controller/recommended_for_you_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RecommendedForYouScreen.
///
/// This class ensures that the RecommendedForYouController is created when the
/// RecommendedForYouScreen is first loaded.
class RecommendedForYouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendedForYouController());
  }
}
