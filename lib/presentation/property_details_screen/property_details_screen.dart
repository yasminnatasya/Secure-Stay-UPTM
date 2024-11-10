import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/chat_details_screen/chat_details_screen.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/models/bedroomslist_item_model.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/models/property_details_model.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/widgets/bedroomslist_item_widget.dart';
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
        setState(() {
          propertyData = doc.data();

          // Update bedroomsListItemList based on Firestore data
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
        });
      } else {
        print("No data found for propertyId: ${widget.propertyId}");
      }
    } catch (e) {
      print("Failed to fetch property details: $e");
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
                              Column(
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
    return SizedBox(
      height: 420.v,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 2, // Adjust based on available images
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return CustomImageView(
                imagePath: propertyData?['image_url'] ??
                    ImageConstant.imgRectangle4429,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
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
        isDismissible: false, FacilitiesViewAll(), isScrollControlled: true);
  }

  void onTapBookNow() {
    Get.toNamed(AppRoutes.bookingDetailsScreen);
  }

  void onChatNowButtonPressed() {
    String ownerId = propertyData?['user_id'] ?? '';
    String chatId = generateChatId(ownerId, widget.propertyId);

    // Navigate to ChatDetailsScreen and pass chatId, ownerId, and propertyDetails
    Get.to(
      ChatDetailsScreen(
        chatId: chatId,
        ownerId: ownerId,
        propertyDetails: {
          'title': propertyData?['title'] ?? 'No Name',
          'address': propertyData?['address'] ?? 'No Address',
          'monthlyRent': propertyData?['monthly_rent'] ?? 'N/A',
          'imageUrl':
              propertyData?['image_url'] ?? ImageConstant.imgRectangle4429,
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
