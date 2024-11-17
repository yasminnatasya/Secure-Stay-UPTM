import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/presentation/home_screen_page/widgets/propertylist_item_widget.dart';
import 'controller/favorite_controller.dart';
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
  final FavoriteController favoriteController = Get.put(FavoriteController());

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
              child: Obx(() {
                if (favoriteController
                    .favoriteModel.value.favoriteItemList.value.isEmpty) {
                  return Center(child: Text("No favorite properties found."));
                }

                return GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 210.h,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.h,
                  ),
                  itemCount: favoriteController
                      .favoriteModel.value.favoriteItemList.value.length,
                  itemBuilder: (context, index) {
                    var property = favoriteController
                        .favoriteModel.value.favoriteItemList.value[index];

                    String truncatedAddress =
                        property.washington.value.length > 10
                            ? "${property.washington.value.substring(0, 10)}..."
                            : property.washington.value;

                    return RecommendedFormat(
                      image: property.grandtown.value,
                      name: property.shermanOaks.value,
                      address: truncatedAddress,
                      price: '',
                      type: '',
                      bed: property.beds.value.toString(), // Pass beds
                      bathtub: property.baths.value.toString(), // Pass baths
                      onTap: () {
                        // Pass the property ID directly
                        Get.toNamed(
                          AppRoutes.propertyDetailsScreen,
                          parameters: {'propertyId': property.id.value},
                        );
                      },
                      likeOnTap: () {
                        property.three.value = !property.three.value;
                        favoriteController.update();
                      },
                      likeImage: SvgPicture.asset(
                        property.three.value
                            ? ImageConstant.imgLikeGray900
                            : ImageConstant.imgLike,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    );
                  },
                );
              }),
            ),
          ],
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
          onTap: () => Get.back(),
          imagePath: ImageConstant.imgIcArrowLeft,
          margin: EdgeInsets.only(left: 20.h, top: 2.v, bottom: 5.v),
        ),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_favorite".tr),
      ),
    );
  }
}
