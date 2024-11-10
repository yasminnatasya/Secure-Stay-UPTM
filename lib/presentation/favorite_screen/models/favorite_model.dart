import '../../../core/app_export.dart';
import 'favorite_item_model.dart';

/// This class defines the variables used in the [favorite_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FavoriteModel {
  Rx<List<FavoriteItemModel>> favoriteItemList = Rx([
    FavoriteItemModel(
        grandtown: ImageConstant.imgRectangle17858.obs,
        shermanOaks: "Grand town".obs,
        washington: "4517 new york ave".obs),
    FavoriteItemModel(
        grandtown: ImageConstant.imgBg.obs,
        shermanOaks: "Need roommate".obs,
        washington: "8502 preston rd. Inglewood".obs),
    FavoriteItemModel(
        grandtown: ImageConstant.imgRectangle178587.obs,
        shermanOaks: "Sherman height".obs,
        washington: "2118 thornridge cir. syracuse".obs),
    FavoriteItemModel(
        grandtown: ImageConstant.imgRectangle178588.obs,
        shermanOaks: "City dwellers".obs,
        washington: "2464 royal in. mesa".obs),
    FavoriteItemModel(
        grandtown: ImageConstant.imgRectangle178589.obs,
        shermanOaks: "Sunshine town".obs,
        washington: "1901 thornridge cir. shiloh".obs),
    FavoriteItemModel(
        grandtown: ImageConstant.imgRectangle1785810.obs,
        shermanOaks: "Need roommate".obs,
        washington: "4517 washington ave.".obs),
    FavoriteItemModel(
        grandtown: ImageConstant.imgRectangle1785811.obs,
        shermanOaks: "Party new york".obs,
        washington: "4517 new york ave".obs),
    FavoriteItemModel(
        grandtown: ImageConstant.imgRectangle1785812.obs,
        shermanOaks: "Party new york".obs,
        washington: "4517 new york ave".obs)
  ]);
}
