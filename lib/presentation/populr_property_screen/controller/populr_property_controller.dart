import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uptm_secure_stay/presentation/populr_property_screen/models/populr_property_model.dart';
import 'package:uptm_secure_stay/presentation/populr_property_screen/models/propertygrid_item_model.dart';

class PopulrPropertyController extends GetxController {
  static PopulrPropertyController get to => Get.find(); // Singleton instance

  RxList<PopularPropertyListItemModel> popularPropertiesList =
      <PopularPropertyListItemModel>[].obs;
  RxList<PopularPropertyListItemModel> limitedPopularProperties =
      <PopularPropertyListItemModel>[].obs; // for the home screen

  @override
  void onInit() {
    super.onInit();
    fetchPopularProperties();
    fetchLimitedPopularProperties();
  }

  Future<void> fetchPopularProperties() async {
    try {
      print("Fetching all properties...");
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('accommodations').get();

      List<PopularPropertyListItemModel> properties = [];
      print("Total documents fetched: ${snapshot.docs.length}");
      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        String address = data['address'] ?? '';
        bool isAvailable = data['is_available'] ?? false;

        print("Document data: $data");
        print("Address: $address, isAvailable: $isAvailable");

        if (address.toLowerCase().contains('shamelin') && isAvailable) {
          print("Adding property: ${data['title']}");

          // Retrieve the first image from image_urls array
          List<dynamic>? imageUrls = data['image_urls'] as List<dynamic>?;
          String firstImageUrl =
              imageUrls != null && imageUrls.isNotEmpty ? imageUrls[0] : '';

          properties.add(PopularPropertyListItemModel(
            id: doc.id, // Add the document ID
            image: firstImageUrl,
            name: data['title'] ?? 'No Title',
            address: address,
            price: '\RM${data['monthly_rent'] ?? 0}',
            type: '/mo',
            bed: '${data['beds'] ?? 'N/A'}',
            bathtub: '${data['baths'] ?? 'N/A'}',
            isFavourite: false,
          ));
        }
      }
      print(
          "Total properties added to popularPropertiesList: ${properties.length}");
      popularPropertiesList.assignAll(properties);
    } catch (e) {
      print("Error fetching properties: $e");
      Get.snackbar('Error', 'Failed to fetch properties: $e');
    }
  }

  Future<void> fetchLimitedPopularProperties() async {
    try {
      print("Fetching limited properties...");

      // Fetch available accommodations
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('accommodations')
          .where('is_available', isEqualTo: true)
          .limit(10) // Increase the limit to filter more effectively
          .get();

      List<PopularPropertyListItemModel> properties = [];
      print("Total documents fetched: ${snapshot.docs.length}");

      // Define the popular keywords
      List<String> popularKeywords = [
        'taman shamelin perkasa',
        'shamelin',
        'sky residence',
        'shamelin star'
      ];

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        String address = data['address']?.toLowerCase() ?? '';
        bool isAvailable = data['is_available'] ?? false;

        print("Document data: $data");
        print("Address: $address, isAvailable: $isAvailable");

        // Check if the address contains any of the popular keywords
        bool isPopular = popularKeywords
            .any((keyword) => address.contains(keyword.toLowerCase()));

        if (isPopular && isAvailable) {
          print("Adding popular property: ${data['title']}");

          // Retrieve the first image from image_urls array
          List<dynamic>? imageUrls = data['image_urls'] as List<dynamic>?;
          String firstImageUrl =
              imageUrls != null && imageUrls.isNotEmpty ? imageUrls[0] : '';

          properties.add(PopularPropertyListItemModel(
            id: doc.id, // Add the document ID
            image: firstImageUrl,
            name: data['title'] ?? 'No Title',
            address: data['address'] ?? 'No Address',
            price: '\RM${data['monthly_rent'] ?? 0}',
            type: '/mo',
            bed: '${data['beds'] ?? 'N/A'}',
            bathtub: '${data['baths'] ?? 'N/A'}',
            isFavourite: false,
          ));
        }
      }

      print(
          "Total properties added to limitedPopularProperties: ${properties.length}");
      limitedPopularProperties.assignAll(properties);
      update(); // Notify UI update
    } catch (e) {
      print("Error fetching limited properties: $e");
      Get.snackbar('Error', 'Failed to fetch limited properties: $e');
    }
  }
}
