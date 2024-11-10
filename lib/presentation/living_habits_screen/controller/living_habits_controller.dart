import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/living_habits_screen/models/living_habits_model.dart';

/// A controller class for the LivingHabitsScreen.
///
/// This class manages the state of the LivingHabitsScreen, including the
/// current livingHabitsModelObj
class LivingHabitsController extends GetxController {
  Rx<LivingHabitsModel> livingHabitsModelObj = LivingHabitsModel().obs;

  Rx<bool> daily = false.obs;
  Rx<bool> occasionally = false.obs;
  Rx<bool> never = false.obs;

  Rx<bool> daily1 = false.obs;
  Rx<bool> occasionally1 = false.obs;
  Rx<bool> never1 = false.obs;

  Rx<bool> daily2 = false.obs;
  Rx<bool> occasionally2 = false.obs;
  Rx<bool> never2 = false.obs;

  Rx<bool> have = false.obs;
  Rx<bool> doNotHave = false.obs;
  Rx<bool> maybe = false.obs;

  Rx<bool> fruits = false.obs;
  Rx<bool> vegetables = false.obs;
  Rx<bool> milk = false.obs;

  Rx<bool> snacks = false.obs;
  Rx<bool> sweets = false.obs;
  Rx<bool> others = false.obs;
}
