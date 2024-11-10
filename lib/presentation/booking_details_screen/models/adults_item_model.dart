import '../../../core/app_export.dart';/// This class is used in the [adults_item_widget] screen.
class AdultsItemModel {AdultsItemModel({this.adults, this.duration, this.two, this.id, }) { adults = adults  ?? Rx("Adults");duration = duration  ?? Rx("After 12 years");two = two  ?? Rx("02");id = id  ?? Rx(""); }

Rx<String>? adults;

Rx<String>? duration;

Rx<String>? two;

Rx<String>? id;

 }
