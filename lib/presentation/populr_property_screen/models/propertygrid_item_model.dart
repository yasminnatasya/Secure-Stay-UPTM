
/// This class is used in the [propertygrid_item_widget] screen.

class PopularPropertyListItemModel {
  String image;

  String name;

  String address;

  String price;
  String type;

  String? bed;

  String? bathtub;
  bool isFavourite ;

  int? id;

  PopularPropertyListItemModel({
    required this.image,
    required this.name,
    required this.address,
    required this.price,
    required this.type,
    required this.isFavourite,
    this.bed,
    this.bathtub,
    this.id,
  });
}
