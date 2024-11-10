import '../controller/expore_with_search_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExporeWithSearchScreen.
///
/// This class ensures that the ExporeWithSearchController is created when the
/// ExporeWithSearchScreen is first loaded.
class ExporeWithSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExporeWithSearchController());
  }
}
