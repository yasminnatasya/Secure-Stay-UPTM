import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/favorite_screen/models/favorite_model.dart';

/// A controller class for the FavoriteScreen.
///
/// This class manages the state of the FavoriteScreen, including the
/// current favoriteModelObj
class FavoriteController extends GetxController {
  Rx<FavoriteModel> favoriteModelObj = FavoriteModel().obs;
}
