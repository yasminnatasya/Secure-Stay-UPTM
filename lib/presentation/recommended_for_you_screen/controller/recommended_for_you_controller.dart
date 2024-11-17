import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/models/propertygrid1_item_model.dart';

class RecommendedForYouController extends GetxController {
  RxList<RecommendedPropertyListItemModel> accommodationsList =
      <RecommendedPropertyListItemModel>[].obs;
  RxList<String> favoriteList = <String>[].obs;
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void onInit() {
    super.onInit();
    // Start listening to the accommodations stream.
    getAccommodationsStream().listen((snapshot) {
      List<RecommendedPropertyListItemModel> accommodations =
          snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        bool isFavorited =
            (data['favorites'] as List<dynamic>?)?.contains(userId) ?? false;

        // Check if 'image_urls' is a list and get the first image
        List<dynamic>? imageUrls = data['image_urls'] as List<dynamic>?;
        String firstImageUrl =
            imageUrls != null && imageUrls.isNotEmpty ? imageUrls[0] : '';

        return RecommendedPropertyListItemModel(
          id: doc.id,
          image: firstImageUrl,
          name: data['title'] ?? 'No Title',
          address: data['address'] ?? 'No Address',
          price: "RM${data['monthly_rent'] ?? 'N/A'}/mo",
          type: data['type'] ?? '',
          bed: data['beds']?.toString() ?? 'N/A',
          bathtub: data['baths']?.toString() ?? 'N/A',
          isFavourite: isFavorited,
        );
      }).toList();

      accommodationsList.assignAll(accommodations);
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAccommodationsStream() {
    return FirebaseFirestore.instance
        .collection('accommodations')
        .where('is_available', isEqualTo: true)
        .snapshots();
  }

  void toggleFavorite(String propertyId) async {
    if (userId == null) return;

    try {
      final docRef = FirebaseFirestore.instance
          .collection('accommodations')
          .doc(propertyId);
      final snapshot = await docRef.get();

      if (snapshot.exists) {
        List<String> favorites =
            List<String>.from(snapshot.data()?['favorites'] ?? []);

        if (favorites.contains(userId)) {
          favorites.remove(userId);
        } else {
          favorites.add(userId!);
        }

        await docRef.update({'favorites': favorites});
        favoriteList.contains(propertyId)
            ? favoriteList.remove(propertyId)
            : favoriteList.add(propertyId);
      }
    } catch (e) {
      print("Failed to toggle favorite status: $e");
    }
  }
}
