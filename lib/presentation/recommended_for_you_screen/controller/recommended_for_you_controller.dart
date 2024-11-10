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
    fetchAccommodations();
  }

  void fetchAccommodations() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('accommodations')
          .where('is_available', isEqualTo: true)
          .get();

      List<RecommendedPropertyListItemModel> accommodations =
          snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        bool isFavorited =
            (data['favorites'] as List<dynamic>?)?.contains(userId) ?? false;

        return RecommendedPropertyListItemModel(
          id: doc.id,
          image: data['image_url'] ?? '',
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
    } catch (e) {
      print("Failed to fetch accommodations: $e");
    }
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
