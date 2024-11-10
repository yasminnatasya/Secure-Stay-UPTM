import '../../../core/app_export.dart';/// This class is used in the [bedroomslist1_item_widget] screen.
class Bedroomslist1ItemModel {Bedroomslist1ItemModel({this.bedrooms, this.bedroomsCounter, this.id, }) { bedrooms = bedrooms  ?? Rx(ImageConstant.imgGroup38134Black900);bedroomsCounter = bedroomsCounter  ?? Rx("05 bedrooms");id = id  ?? Rx(""); }

Rx<String>? bedrooms;

Rx<String>? bedroomsCounter;

Rx<String>? id;

 }
