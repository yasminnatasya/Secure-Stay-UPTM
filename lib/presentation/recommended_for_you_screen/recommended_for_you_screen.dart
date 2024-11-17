import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptm_secure_stay/presentation/home_screen_page/widgets/propertylist_item_widget.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/models/recommended_for_you_model.dart';
import 'package:uptm_secure_stay/widgets/animation_widget.dart';
import '../recommended_for_you_screen/widgets/propertygrid1_item_widget.dart';
import 'controller/recommended_for_you_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/property_details_screen.dart';

class RecommendedForYouScreen extends StatefulWidget {
  const RecommendedForYouScreen({super.key});

  @override
  State<RecommendedForYouScreen> createState() =>
      _RecommendedForYouScreenState();
}

class _RecommendedForYouScreenState extends State<RecommendedForYouScreen> {
  final RecommendedForYouController recommendedForYouController =
      Get.put(RecommendedForYouController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    // Ensure the controller stream is active
    recommendedForYouController.getAccommodationsStream();

    return Scaffold(
      backgroundColor: appTheme.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: appTheme.gray100,
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: animationFunction(
                  0,
                  duration: Duration(milliseconds: 500),
                  Obx(
                    () => GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 24.v,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 210.h,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.h,
                      ),
                      itemCount:
                          recommendedForYouController.accommodationsList.length,
                      itemBuilder: (context, index) {
                        var property = recommendedForYouController
                            .accommodationsList[index];

                        // Truncate long address strings
                        String truncatedAddress = property.address != null &&
                                property.address!.length > 10
                            ? "${property.address!.substring(0, 10)}..."
                            : property.address ?? 'No Address';

                        // Select the appropriate SVG icon for the like button
                        final likeIcon = SvgPicture.asset(
                          property.isFavourite
                              ? ImageConstant.imgLikeGray900
                              : ImageConstant.imgLike,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        );

                        return property.type == "/entry"
                            ? RecommendedEntryFormat(
                                image: property.image ?? '',
                                name: property.name ?? 'Unnamed Property',
                                address: truncatedAddress,
                                price: property.price ?? 'N/A',
                                type: property.type ?? '',
                                onTap: () {
                                  print(
                                      "Navigating to PropertyDetailsScreen with propertyId: ${property.id}");
                                  Get.to(PropertyDetailsScreen(
                                      propertyId: property.id ?? ''));
                                },
                                likeOnTap: () {
                                  recommendedForYouController
                                      .toggleFavorite(property.id ?? '');
                                },
                                likeImage: likeIcon, // Use the SVG icon here
                              )
                            : RecommendedFormat(
                                image: property.image ?? '',
                                name: property.name ?? 'Unnamed Property',
                                address: truncatedAddress,
                                price: property.price ?? 'N/A',
                                type: property.type ?? '',
                                bed: property.bed ?? 'N/A',
                                bathtub: property.bathtub ?? 'N/A',
                                onTap: () {
                                  print(
                                      "Navigating to PropertyDetailsScreen with propertyId: ${property.id}");
                                  Get.to(PropertyDetailsScreen(
                                      propertyId: property.id ?? ''));
                                },
                                likeOnTap: () {
                                  recommendedForYouController
                                      .toggleFavorite(property.id ?? '');
                                },
                                likeImage: likeIcon, // Use the SVG icon here
                              );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Define the animated like/unlike icon
  Widget _buildAnimatedLikeIcon(bool isFavourite) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            isFavourite ? Colors.red : Colors.grey, BlendMode.srcIn),
        child: Image.asset(
          isFavourite ? ImageConstant.imgLikeGray900 : ImageConstant.imgLike,
          key: ValueKey(isFavourite ? 'liked' : 'unliked'),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
      decoration: AppDecoration.outlineGray10001,
      child: CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
          onTap: () {
            Get.back();
          },
          imagePath: ImageConstant.imgIcArrowLeft,
          margin: EdgeInsets.only(left: 20.h, top: 2.v, bottom: 5.v),
        ),
        centerTitle: true,
        title: AppbarSubtitle(text: "msg_recommended_for".tr),
      ),
    );
  }

  onTapEntryProperty() {
    Get.toNamed(AppRoutes.propertyDetailsOneScreen);
  }

  onTapProperty() {
    Get.toNamed(AppRoutes.propertyDetailsScreen);
  }
}
