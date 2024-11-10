import 'package:cloud_firestore/cloud_firestore.dart';

class BedroomlistItemModel {
  String id;
  String title;
  String address;
  int beds;
  int baths;
  int monthlyRent;
  String description;
  String imageUrl;
  int deposit;
  String availableDate;
  String minimumStay;
  int sqft;
  bool airCondition;
  bool elevator;
  bool furniture;
  bool generator;
  bool wifi;
  bool students;
  bool male;
  bool nonsmoker;
  bool petLover;
  bool vegetarian;
  bool isAvailable; // New field for availability status

  BedroomlistItemModel({
    required this.id,
    required this.title,
    required this.address,
    required this.beds,
    required this.baths,
    required this.monthlyRent,
    required this.description,
    required this.imageUrl,
    required this.deposit,
    required this.availableDate,
    required this.minimumStay,
    required this.sqft,
    required this.airCondition,
    required this.elevator,
    required this.furniture,
    required this.generator,
    required this.wifi,
    required this.students,
    required this.male,
    required this.nonsmoker,
    required this.petLover,
    required this.vegetarian,
    required this.isAvailable, // Initialize isAvailable in constructor
  });

  factory BedroomlistItemModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return BedroomlistItemModel(
      id: doc.id,
      title: data['title'] ?? '',
      address: data['address'] ?? '',
      beds: (data['beds'] ?? 0).toInt(),
      baths: (data['baths'] ?? 0).toInt(),
      monthlyRent: (data['monthly_rent'] ?? 0).toInt(),
      description: data['description'] ?? '',
      imageUrl: data['image_url'] ?? '',
      deposit: (data['deposit'] ?? 0).toInt(),
      availableDate: data['available_date'] ?? '',
      minimumStay: data['minimum_stay'] ?? '',
      sqft: (data['sqft'] ?? 0).toInt(),
      airCondition: data['air_condition'] ?? false,
      elevator: data['elevator'] ?? false,
      furniture: data['furniture'] ?? false,
      generator: data['generator'] ?? false,
      wifi: data['wifi'] ?? false,
      students: data['students'] ?? false,
      male: data['male'] ?? false,
      nonsmoker: data['nonsmoker'] ?? false,
      petLover: data['pet_lover'] ?? false,
      vegetarian: data['vegetarian'] ?? false,
      isAvailable: data['is_available'] ?? true, // Default to true if missing
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'address': address,
      'beds': beds,
      'baths': baths,
      'monthly_rent': monthlyRent,
      'description': description,
      'image_url': imageUrl,
      'deposit': deposit,
      'available_date': availableDate,
      'minimum_stay': minimumStay,
      'sqft': sqft,
      'air_condition': airCondition,
      'elevator': elevator,
      'furniture': furniture,
      'generator': generator,
      'wifi': wifi,
      'students': students,
      'male': male,
      'nonsmoker': nonsmoker,
      'pet_lover': petLover,
      'vegetarian': vegetarian,
      'is_available': isAvailable, // Add isAvailable to Firestore data
    };
  }
}
