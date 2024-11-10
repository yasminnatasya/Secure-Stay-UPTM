class LocationIdItemModel {
  String id;
  String image;
  String name;
  String address; // Add this field
  String price;
  String type;
  String? bed;
  String? bathtub;
  String sqft;
  bool isFavourite;
  double latitude;
  double longitude;
  double distance;

  LocationIdItemModel({
    required this.id,
    required this.image,
    required this.name,
    required this.address, // Include the address in the constructor
    required this.price,
    required this.type,
    this.bed,
    this.bathtub,
    required this.sqft,
    required this.isFavourite,
    required this.latitude,
    required this.longitude,
    required this.distance,
  });
}
