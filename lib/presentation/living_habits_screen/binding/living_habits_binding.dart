import '../controller/living_habits_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LivingHabitsScreen.
///
/// This class ensures that the LivingHabitsController is created when the
/// LivingHabitsScreen is first loaded.
class LivingHabitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LivingHabitsController());
  }
}
