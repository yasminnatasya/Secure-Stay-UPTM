import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/presentation/my_property_screen/models/bedroomlist_item_model.dart';
import 'package:uptm_secure_stay/presentation/my_property_screen/models/my_property_model.dart';

/// A controller class for the MyPropertyScreen.
class MyPropertyController extends GetxController {
  Rx<MyPropertyModel> myPropertyModelObj = MyPropertyModel().obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    fetchProperties();
  }

  Future<void> fetchProperties() async {
  final currentUser = _auth.currentUser;
  if (currentUser == null) {
    print('No user is logged in.');
    return;
  }

  try {
    // Clear the current list to avoid displaying stale data
    myPropertyModelObj.value.bedroomlistItemList.value.clear();

    // Fetch only properties where user_id matches the current user's UID
    final querySnapshot = await _firestore
        .collection('accommodations')
        .where('user_id', isEqualTo: currentUser.uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final properties = querySnapshot.docs.map((doc) {
        return BedroomlistItemModel.fromFirestore(doc);
      }).toList();

      myPropertyModelObj.value.bedroomlistItemList.value = properties;
    } else {
      print('No properties found for user: ${currentUser.uid}');
    }

    myPropertyModelObj.refresh();
  } catch (e) {
    print('Error fetching properties for user ${currentUser.uid}: $e');
  }
}


  Future<void> deleteProperty(BedroomlistItemModel property) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    try {
      // Delete the image from Firebase Storage
      if (property.imageUrls.isNotEmpty) {
        final ref = FirebaseStorage.instance.refFromURL(property.imageUrls[0]);
        await ref.delete();
      }

      // Delete the document from Firestore
      await _firestore.collection('accommodations').doc(property.id).delete();

      // Remove the deleted property from the list in the app state
      myPropertyModelObj.value.bedroomlistItemList.value.remove(property);
      myPropertyModelObj.refresh(); // Update the UI
    } catch (e) {
      print('Error deleting property: $e');
    }
  }
}
