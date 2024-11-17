import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/utils/image_constant.dart';
import 'package:uptm_secure_stay/presentation/favorite_screen/models/favorite_model.dart';
import 'package:uptm_secure_stay/presentation/favorite_screen/models/favorite_item_model.dart';

class FavoriteController extends GetxController {
  Rx<FavoriteModel> favoriteModel = FavoriteModel().obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    listenToFavoriteProperties();
  }

  void listenToFavoriteProperties() {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    _firestore
        .collection('accommodations')
        .where('favorites', arrayContains: currentUser.uid)
        .snapshots()
        .listen((snapshot) {
      List<FavoriteItemModel> favoriteItems = snapshot.docs.map((doc) {
        List<dynamic>? imageUrls = doc['image_urls'] as List<dynamic>?;
        String firstImageUrl = imageUrls != null && imageUrls.isNotEmpty
            ? imageUrls[0]
            : ImageConstant.imgBg;

        return FavoriteItemModel(
          id: doc.id, // Fetch and store document ID
          grandtown: firstImageUrl,
          shermanOaks: doc['title'] ?? 'Unknown Title',
          washington: doc['address'] ?? 'Unknown Address',
          beds: doc['beds'] ?? 0, // Fetch beds
          baths: doc['baths'] ?? 0, // Fetch baths
        );
      }).toList();

      favoriteModel.value.favoriteItemList.value = favoriteItems;
    });
  }
}
