import '../controller/my_cards_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyCardsScreen.
///
/// This class ensures that the MyCardsController is created when the
/// MyCardsScreen is first loaded.
class MyCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCardsController());
  }
}
