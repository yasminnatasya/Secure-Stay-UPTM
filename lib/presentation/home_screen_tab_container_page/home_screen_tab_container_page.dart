import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uptm_secure_stay/presentation/home_screen_page/controller/home_screen_controller.dart';
import 'package:uptm_secure_stay/presentation/home_screen_page/home_screen_page.dart';
import 'package:uptm_secure_stay/services/firestore_service.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart'; // Import EncryptionHelper

import 'controller/home_screen_tab_container_controller.dart';
import 'models/home_screen_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreenTabContainerPage extends StatelessWidget {
  HomeScreenTabContainerPage({Key? key}) : super(key: key);

  HomeScreenTabContainerController controller = Get.put(
      HomeScreenTabContainerController(HomeScreenTabContainerModel().obs));

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return FutureBuilder<String>(
      future: _getUsername(), // Fetch the decrypted username
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData) {
          return Center(child: Text("Failed to load username"));
        }

        String username = snapshot.data ?? "User";

        return GetBuilder(
          init: HomeScreenController(),
          builder: (controller) => Container(
            color: appTheme.gray100,
            child: Stack(
              children: [
                _buildHelloUserStack(
                    username), // Pass the decrypted username here
                HomeScreenPage(),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> _getUsername() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) throw Exception("User not logged in");

      print("Fetching username for UID: ${currentUser.uid}");
      DocumentSnapshot userDoc = await _firestoreService.firestore
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        print("Encrypted name from Firestore: ${userData['name']}");

        // Decrypt the 'name' field using EncryptionHelper
        String encryptedName = userData['name'] ?? '';
        if (encryptedName.isEmpty) {
          print("Encrypted name is empty.");
          return "User";
        }

        String decryptedName = EncryptionHelper.decrypt(encryptedName);
        print("Decrypted User Name: $decryptedName");
        return decryptedName;
      } else {
        print("User document not found in Firestore");
        throw Exception("User document not found");
      }
    } catch (e) {
      print("Error fetching or decrypting username: $e");
      return "User";
    }
  }

  /// Section Widget
  Widget _buildHelloUserStack(String username) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 250.v,
            padding: EdgeInsets.symmetric(vertical: 16.v),
            decoration: AppDecoration.fillPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL16,
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgRectangle34624202,
                  ),
                  fit: BoxFit.fill,
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: SizedBox(
                height: 66.v,
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello,\n$username 👋', // Display the decrypted username here
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.fSize,
                          fontFamily: 'Neutrif Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.notificationsScreen);
                        },
                        child: Container(
                          height: 36.v,
                          width: 36.h,
                          padding: EdgeInsets.all(7.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFf4D7D78)),
                            shape: BoxShape.circle,
                          ),
                          child: CustomImageView(
                            color: Colors.white,
                            imagePath: ImageConstant.imgIcNotification,
                            height: 36.adaptSize,
                            width: 36.adaptSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
