import '../../../core/app_export.dart';/// This class is used in the [favorite_item_widget] screen.
class FavoriteItemModel {FavoriteItemModel({this.grandtown, this.shermanOaks, this.washington, this.three, this.three1, this.id, }) { grandtown = grandtown  ?? Rx(ImageConstant.imgRectangle17858);shermanOaks = shermanOaks  ?? Rx("Grand town");washington = washington  ?? Rx("4517 new york ave");three = three  ?? Rx(false);three1 = three1  ?? Rx(false);id = id  ?? Rx(""); }

Rx<String>? grandtown;

Rx<String>? shermanOaks;

Rx<String>? washington;

Rx<bool>? three;

Rx<bool>? three1;

Rx<String>? id;

 }
