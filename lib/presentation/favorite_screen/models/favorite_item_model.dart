import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [favorite_item_widget] screen.
class FavoriteItemModel {
  FavoriteItemModel({
    String? grandtown,
    String? shermanOaks,
    String? washington,
    bool? three,
    bool? three1,
    String? id,
    int? beds, // Add beds
    int? baths, // Add baths
  }) {
    this.grandtown = (grandtown ?? ImageConstant.imgRectangle17858).obs;
    this.shermanOaks = (shermanOaks ?? "Grand town").obs;
    this.washington = (washington ?? "4517 new york ave").obs;
    this.three = (three ?? false).obs;
    this.three1 = (three1 ?? false).obs;
    this.id = (id ?? "").obs;
    this.beds = (beds ?? 0).obs; // Initialize beds
    this.baths = (baths ?? 0).obs; // Initialize baths
  }

  late RxString grandtown;
  late RxString shermanOaks;
  late RxString washington;
  late RxBool three;
  late RxBool three1;
  late RxString id;
  late RxInt beds; // Reactive beds field
  late RxInt baths; // Reactive baths field
}
