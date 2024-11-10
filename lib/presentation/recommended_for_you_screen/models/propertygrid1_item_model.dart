/// This class is used in the [propertygrid1_item_widget] screen.

class RecommendedPropertyListItemModel {
  String image;

  String name;

  String address;

  String price;
  String type;

  String? bed;

  String? bathtub;
  bool isFavourite;
  String? id;

  RecommendedPropertyListItemModel({
    required this.image,
    required this.name,
    required this.address,
    required this.price,
    required this.type,
    this.bed,
    this.bathtub,
    this.id,
    required this.isFavourite,
  });
}
