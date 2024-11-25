import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/chat_details_screen.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/models/bedroomslist_item_model.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/models/property_details_model.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/widgets/bedroomslist_item_widget.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';
import 'package:expandable_text/expandable_text.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final String propertyId;

  const PropertyDetailsScreen({super.key, required this.propertyId});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  Map<String, dynamic>? propertyData;
  List<BedRoomsListItemModel> bedroomsListItemList =
      []; // Initialize an empty list

  @override
  void initState() {
    super.initState();
    fetchPropertyData();
  }

  Future<void> fetchPropertyData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('accommodations')
          .doc(widget.propertyId)
          .get();

      if (doc.exists) {
        propertyData = doc.data();

        // Fetch owner details
        final ownerId = propertyData?['user_id'] ?? '';
        if (ownerId.isNotEmpty) {
          final ownerDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(ownerId)
              .get();

          if (ownerDoc.exists) {
            final ownerData = ownerDoc.data();

            // Fetch and decrypt owner details
            propertyData?['owner_name'] =
                ownerData != null ? tryDecrypt(ownerData['name']) : 'Unknown';
            propertyData?['owner_email'] =
                ownerData != null ? tryDecrypt(ownerData['email']) : 'Unknown';

            // Fetch displayEmail preference
            propertyData?['displayEmail'] =
                ownerData != null ? ownerData['displayEmail'] ?? true : true;
          }
        }

        // Update facilities
        bedroomsListItemList = [
          BedRoomsListItemModel(
            image: ImageConstant.imgGroup38134Black900,
            tittle: "${propertyData?['beds'] ?? 'N/A'} Bedrooms",
          ),
          BedRoomsListItemModel(
            image: ImageConstant.imgGroup38134,
            tittle: "${propertyData?['baths'] ?? 'N/A'} Bathrooms",
          ),
          BedRoomsListItemModel(
            image: ImageConstant.imgIcSquarefeetGray900,
            tittle: "${propertyData?['sqft'] ?? 'N/A'} Square Feet",
          ),
        ];
      }

      setState(() {});
    } catch (e) {
      print("Failed to fetch property details: $e");
    }
  }

  String tryDecrypt(String? value) {
    if (value == null || value.isEmpty) {
      return 'Unknown';
    }
    try {
      return EncryptionHelper.decrypt(value);
    } catch (e) {
      print("Decryption Error: $e");
      return 'Decryption Failed';
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.white,
      body: propertyData == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: appTheme.gray100,
              width: double.maxFinite,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: [
                        _buildImageStack(),
                        SizedBox(height: 16.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                // Wrap the Column with Expanded
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      propertyData?['title'] ?? 'No Name',
                                      style: theme.textTheme.titleLarge,
                                    ),
                                    SizedBox(height: 8.v),
                                    Text(
                                      propertyData?['address'] ?? 'No Address',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(color: appTheme.gray800),
                                    ),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: propertyData?['monthly_rent'] !=
                                              null
                                          ? "RM${propertyData?['monthly_rent']}/mo"
                                          : 'N/A',
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(color: appTheme.redA200),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.v),
                        // Owner Details Section in PropertyDetailsScreen
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Owner Details",
                                style: theme.textTheme.titleMedium,
                              ),
                              SizedBox(height: 8.v),
                              Row(
                                children: [
                                  Icon(Icons.person,
                                      color: appTheme.gray800, size: 20),
                                  SizedBox(width: 8.h),
                                  Text(
                                    propertyData?['owner_name'] ?? 'N/A',
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.v),
                              if (propertyData?['displayEmail'] ==
                                  true) // Check displayEmail flag
                                Row(
                                  children: [
                                    Icon(Icons.email,
                                        color: appTheme.gray800, size: 20),
                                    SizedBox(width: 8.h),
                                    Text(
                                      propertyData?['owner_email'] ?? 'N/A',
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),

                        SizedBox(height: 16.v),
                        SizedBox(
                          height: 100.v,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            itemCount: bedroomsListItemList.length,
                            itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.all(12.h),
                              margin: EdgeInsets.only(right: 16.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.h),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        bedroomsListItemList[index].image,
                                    height: 26.adaptSize,
                                    width: 26.adaptSize,
                                  ),
                                  SizedBox(
                                    height: 18.v,
                                  ),
                                  Text(
                                    bedroomsListItemList[index].tittle,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "Property Description",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: ExpandableText(
                            propertyData?['description'] ??
                                "No description available.",
                            expandText: "Read more",
                            collapseText: 'Show less',
                            maxLines: 3,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(height: 1.50.v),
                            linkColor: appTheme.gray900,
                            linkStyle: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.v),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Facilities',
                                  style: theme.textTheme.titleMedium),
                              GestureDetector(
                                onTap: () {
                                  onTapTxtViewAll();
                                },
                                child: Text(
                                  'View all',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    letterSpacing: 0.14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildFurniture(
                                image: ImageConstant.wifi1,
                                userLabel: "Wifi",
                                backColor: appTheme.white,
                              ),
                              _buildFurniture(
                                image: ImageConstant.furniture1,
                                userLabel: "Furniture",
                                backColor: appTheme.white,
                              ),
                              _buildFurniture(
                                image: ImageConstant.elevator1,
                                userLabel: "Elevator",
                                backColor: appTheme.white,
                              ),
                              _buildFurniture(
                                image: ImageConstant.students1,
                                userLabel: "Students",
                                backColor: appTheme.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 112.v,
                    padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
                    decoration: AppDecoration.white,
                    child: CustomElevatedButton(
                      text: "Chat Now",
                      onPressed: () {
                        onChatNowButtonPressed();
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildImageStack() {
    List<dynamic> imageUrls = propertyData?['image_urls'] ?? [];

    return SizedBox(
      height: 420.v,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: imageUrls.length, // Number of images available
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                child: CustomImageView(
                  imagePath: imageUrls[index] ?? ImageConstant.imgRectangle4429,
                  height: 420.v, // Ensure the height is constrained
                  width: double.infinity,
                  fit:
                      BoxFit.cover, // Use BoxFit.cover for better image scaling
                ),
              );
            },
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(7.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFurniture(
      {required String userLabel,
      required String image,
      required Color backColor}) {
    return Column(
      children: [
        CustomIconButton(
          height: 68.adaptSize,
          width: 68.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillOnPrimaryContainerTL34
              .copyWith(color: backColor),
          child: CustomImageView(imagePath: image),
        ),
        SizedBox(height: 8.v),
        Text(
          userLabel,
          style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray900),
        ),
      ],
    );
  }

  void onTapTxtViewAll() {
    Get.bottomSheet(
      FacilitiesViewAll(propertyData: propertyData ?? {}),
      isDismissible: false,
      isScrollControlled: true,
    );
  }

  void onTapBookNow() {
    Get.toNamed(AppRoutes.bookingDetailsScreen);
  }

  void onChatNowButtonPressed() {
    String ownerId = propertyData?['user_id'] ?? '';
    String chatId = generateChatId(ownerId, widget.propertyId);

    // Check if image_urls array is available and has at least one item
    String? imageUrl = propertyData?['image_urls'] != null &&
            (propertyData!['image_urls'] as List).isNotEmpty
        ? propertyData!['image_urls'][0]
        : null;

    // Navigate to ChatDetailsScreen and pass chatId, ownerId, and propertyDetails
    Get.to(
      ChatDetailsScreen(
        chatId: chatId,
        ownerId: ownerId,
        propertyDetails: {
          'title': propertyData?['title'] ?? 'No Name',
          'address': propertyData?['address'] ?? 'No Address',
          'monthlyRent': propertyData?['monthly_rent'] ?? 'N/A',
          'imageUrl': imageUrl, // Use the first image URL if available
          'propertyId': widget.propertyId, // Pass propertyId
        },
      ),
    );
  }

  String generateChatId(String ownerId, String propertyId) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
    // Include propertyId in the chatId to make it unique per property
    return currentUserId.compareTo(ownerId) < 0
        ? "$currentUserId\_$ownerId\_$propertyId"
        : "$ownerId\_$currentUserId\_$propertyId";
  }
}
