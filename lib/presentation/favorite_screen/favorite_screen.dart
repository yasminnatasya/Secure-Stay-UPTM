import 'package:uptm_secure_stay/presentation/home_screen_page/widgets/propertylist_item_widget.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/controller/recommended_for_you_controller.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/models/recommended_for_you_model.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/widgets/propertygrid1_item_widget.dart';
import 'package:uptm_secure_stay/widgets/animation_widget.dart';

import 'controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteController favoriteController = Get.put(FavoriteController());
  RecommendedForYouController recommendedForYouController =
      Get.put(RecommendedForYouController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.white,
      body: Container(
        width: double.maxFinite,
        color: appTheme.gray100,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: animationFunction(
                0,
                duration: Duration(milliseconds: 500),
                GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 210.h,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.h,
                  ),
                  itemCount: recommendedPropertyListItemList.length,
                  itemBuilder: (context, index) {
                    var property = recommendedPropertyListItemList[index];
                    return property.type == "/entry"
                        ? RecommendedEntryFormat(
                            image: property.image,
                            name: property.name,
                            address: property.address,
                            price: property.price,
                            type: property.type,
                            onTap: () {
                              Get.toNamed(AppRoutes.propertyDetailsScreen);
                            },
                            likeOnTap: () {
                              property.isFavourite = !property.isFavourite;
                              recommendedForYouController.update();
                            },
                            likeImage:
                                _buildAnimatedLikeIcon(property.isFavourite),
                          )
                        : RecommendedFormat(
                            image: property.image,
                            name: property.name,
                            address: property.address,
                            price: property.price,
                            type: property.type,
                            bed: property.bed,
                            bathtub: property.bathtub,
                            onTap: () {
                              Get.toNamed(AppRoutes.propertyDetailsScreen);
                            },
                            likeOnTap: () {
                              property.isFavourite = !property.isFavourite;
                              recommendedForYouController.update();
                            },
                            likeImage:
                                _buildAnimatedLikeIcon(property.isFavourite),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Helper function for animated like icon
  Widget _buildAnimatedLikeIcon(bool isFavourite) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isFavourite ? Colors.red : Colors.grey,
          BlendMode.srcIn,
        ),
        child: Image.asset(
          isFavourite ? ImageConstant.imgLikeGray900 : ImageConstant.imgLike,
          key: ValueKey(isFavourite ? 'liked' : 'unliked'),
        ),
      ),
    );
  }

  /// Section Widget
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
                margin: EdgeInsets.only(left: 20.h, top: 2.v, bottom: 5.v)),
            centerTitle: true,
            title: AppbarSubtitle(
              text: "lbl_favorite".tr,
            )));
  }
}
