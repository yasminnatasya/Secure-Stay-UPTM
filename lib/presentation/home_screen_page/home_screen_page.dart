import 'package:carousel_slider/carousel_slider.dart';
import 'package:uptm_secure_stay/presentation/expore_page/expore_page.dart';
import 'package:uptm_secure_stay/presentation/home_screen_container_screen/controller/home_screen_container_controller.dart';
import 'package:uptm_secure_stay/presentation/populr_property_screen/controller/populr_property_controller.dart';
import 'package:uptm_secure_stay/presentation/populr_property_screen/models/populr_property_model.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/property_details_screen.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/controller/recommended_for_you_controller.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/models/recommended_for_you_model.dart';
import 'package:uptm_secure_stay/presentation/recommended_for_you_screen/widgets/propertygrid1_item_widget.dart';
import 'package:uptm_secure_stay/widgets/animation_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../home_screen_page/widgets/propertylist_item_widget.dart';
import '../home_screen_tab_container_page/controller/home_screen_tab_container_controller.dart';
import '../home_screen_tab_container_page/models/home_screen_tab_container_model.dart';
import 'controller/home_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  HomeScreenContainerController homeScreenContainerController = Get.find();
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  HomeScreenTabContainerController controller = Get.put(
      HomeScreenTabContainerController(HomeScreenTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return animationFunction(
        0,
        ListView(padding: EdgeInsets.symmetric(vertical: 16.v), children: [
          SizedBox(
            height: 140.v,
          ),
          Container(
            height: 278.v,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 16.h,
              right: 16.h,
              bottom: 16.v,
            ),
            decoration: AppDecoration.white.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: SizedBox(
              // height: 40.v,
              width: double.infinity,
              child: Column(
                children: [
                  TabBar(
                    controller: controller.tabviewController,
                    labelPadding: EdgeInsets.zero,
                    labelColor: theme.colorScheme.primaryContainer,
                    unselectedLabelColor: appTheme.gray800,
                    indicatorColor: appTheme.green700,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      // Tab(
                      //   child: Text(
                      //     "lbl_buy".tr,
                      //   ),
                      // ),
                      Tab(
                        child: Text(
                          "lbl_rent".tr,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      child: TabBarView(
                          controller: controller.tabviewController,
                          children: [
                            // _buildBuyTab(),
                            _buildRentTab(),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.v),
            child: cauroselSliderWidget(),
          ),
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular property', style: theme.textTheme.titleMedium),
                // GestureDetector(
                //     onTap: () {
                //       onTapTxtViewAll();
                //     },
                //     child: Text('View all',
                //         textAlign: TextAlign.right,
                //         style: theme.textTheme.bodyMedium))
              ],
            ),
          ),
          SizedBox(height: 16.v),
          _buildBedHorizontalScroll(),
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recommended for you', style: theme.textTheme.titleMedium),
                GestureDetector(
                    onTap: () {
                      onTapTxtViewAll1();
                    },
                    child: Text('View all',
                        textAlign: TextAlign.right,
                        style: theme.textTheme.bodyMedium))
              ],
            ),
          ),
          SizedBox(height: 16.v),
          _buildPropertyList(),
        ]));
  }

  /// Section Widget

  Widget cauroselSliderWidget() {
    return CarouselSlider.builder(
        options: CarouselOptions(
            height: 114.h,
            initialPage: 0,
            autoPlay: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {}),
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          // SliderData model = controller.sliderData[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: ShapeDecoration(
                  color: const Color(0xFFF5E0FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgRectangle17853,
                      ),
                      fit: BoxFit.fill)),
              child: Stack(children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.h, 24.v, 16.h, 24.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_get_15_off".tr,
                                  style: CustomTextStyles
                                      .titleLargeOnPrimaryContainer),
                              SizedBox(height: 12.v),
                              Text("msg_for_new_user_valid".tr,
                                  style: CustomTextStyles
                                      .bodyLargeOnPrimaryContainer)
                            ]),
                        GestureDetector(
                          onTap: () {
                            onTapProperty();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 8.v,
                            ),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                            child: Text(
                              "lbl_book_now".tr,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ]),
            ),
          );
        });
  }

  /// Section Widget
  Widget _buildBedHorizontalScroll() {
    return GetBuilder<PopulrPropertyController>(
      init: Get.put(
          PopulrPropertyController()), // Initialize here if not done globally
      builder: (controller) {
        if (controller.limitedPopularProperties.isEmpty) {
          return Center(child: Text("No properties available."));
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.limitedPopularProperties.length,
                  (index) {
                    var property = controller.limitedPopularProperties[index];
                    return GestureDetector(
                      onTap: () {
                        onTapProperty();
                      },
                      child: Container(
                        height: 124.v,
                        width: 350.h,
                        margin: EdgeInsets.only(right: 16.h),
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Color(0x0D000000),
                              offset: Offset(0, 4),
                              blurRadius: 12,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.h),
                        ),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: property.image,
                              height: 100.adaptSize,
                              width: 100.adaptSize,
                              radius: BorderRadius.circular(12.h),
                            ),
                            SizedBox(width: 12.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 9.v, right: 9.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              property.name,
                                              style: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(height: 9.v),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: property.price,
                                                    style: theme
                                                        .textTheme.titleSmall,
                                                  ),
                                                  TextSpan(
                                                    text: property.type,
                                                    style: CustomTextStyles
                                                        .bodySmallGray80012,
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomIconButton(
                                        height: 24.adaptSize,
                                        width: 24.adaptSize,
                                        padding: EdgeInsets.all(4.h),
                                        decoration:
                                            IconButtonStyleHelper.outlineBlack,
                                        child: CustomImageView(
                                          imagePath: property.isFavourite
                                              ? ImageConstant.imgLikeGray900
                                              : ImageConstant.imgLike,
                                        ),
                                        onTap: () {
                                          // Toggle favorite status and update the UI
                                          property.isFavourite =
                                              !property.isFavourite;
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.v),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.bed,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.h),
                                            child: Text(
                                              property.bed!,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20.h),
                                      Row(
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.bathtub,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.h),
                                            child: Text(
                                              property.bathtub!,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20.h),
                                      Row(
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant
                                                .imgIcSquarefeetGray900,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.h),
                                            child: Text("lbl_2468_sqft".tr,
                                                style:
                                                    theme.textTheme.bodySmall),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // recommendedPropertyListItemList.length > 2
  // ? 2
  //     : recommendedPropertyListItemList.length,
  /// Section Widget
  Widget _buildPropertyList() {
    final RecommendedForYouController controller =
        Get.put(RecommendedForYouController());

    return Obx(() {
      if (controller.accommodationsList.isEmpty) {
        return Center(child: Text("No properties available."));
      }
      return GridView.builder(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 210.h,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.h,
        ),
        itemCount: controller.accommodationsList.length,
        itemBuilder: (context, index) {
          var property = controller.accommodationsList[index];
          bool isFavourite = property.isFavourite;

          return property.type == "/entry"
              ? RecommendedEntryFormat(
                  image: property.image ?? '',
                  name: property.name ?? 'No Name',
                  address: property.address ?? 'No Address',
                  price: property.price ?? 'N/A',
                  type: property.type ?? '',
                  onTap: () {
                    Get.to(
                        PropertyDetailsScreen(propertyId: property.id ?? ''));
                  },
                  likeOnTap: () {
                    // Use controller method to toggle favorite status and update the UI
                    controller.toggleFavorite(property.id ?? '');
                  },
                  likeImage: SvgPicture.asset(
                    isFavourite
                        ? ImageConstant.imgLikeGray900
                        : ImageConstant.imgLike,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                )
              : RecommendedFormat(
                  image: property.image ?? '',
                  name: property.name ?? 'No Name',
                  address: property.address ?? 'No Address',
                  price: property.price ?? 'N/A',
                  type: property.type ?? '',
                  bed: property.bed ?? 'N/A',
                  bathtub: property.bathtub ?? 'N/A',
                  onTap: () {
                    Get.to(
                        PropertyDetailsScreen(propertyId: property.id ?? ''));
                  },
                  likeOnTap: () {
                    // Use controller method to toggle favorite status and update the UI
                    controller.toggleFavorite(property.id ?? '');
                  },
                  likeImage: SvgPicture.asset(
                    isFavourite
                        ? ImageConstant.imgLikeGray900
                        : ImageConstant.imgLike,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                );
        },
      );
    });
  }

  Widget _buildAnimatedLikeIcon(bool isFavourite) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Image.asset(
        isFavourite ? ImageConstant.imgLikeGray900 : ImageConstant.imgLike,
        key: ValueKey(isFavourite ? 'liked' : 'unliked'),
      ),
    );
  }

  // /// Common widget
  // Widget _buildTitleAndViewAll({
  //   required String recommendedFor,
  //   required String viewAll,
  //   VoidCallback? onTapViewAll,
  // }) {
  //   return Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(recommendedFor,
  //             style: theme.textTheme.titleMedium!
  //                 .copyWith(color: appTheme.gray900)),
  //         GestureDetector(onTap: onTapViewAll
  //         ),
  //         Padding(
  //             padding: EdgeInsets.only(bottom: 4.v),
  //             child: Text(viewAll,
  //                 style: theme.textTheme.bodyMedium!
  //                     .copyWith(color: appTheme.gray900)))
  //       ]);
  // }

  /// Navigates to the propertyDetailsOneScreen when the action is triggered.
  onTapProperty() {
    Get.toNamed(
      AppRoutes.propertyDetailsScreen,
    );
  }

  /// Navigates to the populrPropertyScreen when the action is triggered.
  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.populrPropertyScreen,
    );
  }

  /// Navigates to the propertyDetailsScreen when the action is triggered.

  /// Navigates to the recommendedForYouScreen when the action is triggered.
  onTapTxtViewAll1() {
    Get.toNamed(
      AppRoutes.recommendedForYouScreen,
    );
  }

  // Widget _buildBuyTab() {
  //   return Column(
  //     children: [
  //       Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
  //           child: CustomTextFormField(
  //               controller: homeScreenController.searchController,
  //               hintText: "msg_search_location".tr,
  //               textInputAction: TextInputAction.done,
  //               prefix: Container(
  //                   margin: EdgeInsets.fromLTRB(16.h, 16.v, 12.h, 16.v),
  //                   child: CustomImageView(
  //                       imagePath: ImageConstant.imgIcLocation,
  //                       height: 24.adaptSize,
  //                       width: 24.adaptSize)),
  //               prefixConstraints: BoxConstraints(maxHeight: 56.v),
  //               contentPadding:
  //                   EdgeInsets.only(top: 17.v, right: 30.h, bottom: 17.v),
  //               borderDecoration: TextFormFieldStyleHelper.outlineGrayTL16)),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 16.h),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Container(
  //               height: 40.h,
  //               padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
  //               decoration: ShapeDecoration(
  //                 color: Colors.white,
  //                 shape: RoundedRectangleBorder(
  //                   side: BorderSide(width: 1.h, color: appTheme.gray300),
  //                   borderRadius: BorderRadius.circular(6.h),
  //                 ),
  //               ),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   CustomImageView(
  //                     imagePath: ImageConstant.imgIcHome,
  //                     height: 20.adaptSize,
  //                     width: 20.adaptSize,
  //                     margin: EdgeInsets.only(right: 10.h),
  //                   ),
  //                   Text(
  //                     'House',
  //                     style: theme.textTheme.bodyLarge!.copyWith(
  //                       color: appTheme.gray800,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               height: 40.h,
  //               padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
  //               decoration: ShapeDecoration(
  //                 color: Colors.white,
  //                 shape: RoundedRectangleBorder(
  //                   side: BorderSide(width: 1.h, color: appTheme.gray300),
  //                   borderRadius: BorderRadius.circular(6.h),
  //                 ),
  //               ),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   CustomImageView(
  //                     imagePath: ImageConstant.imgIcFlat,
  //                     height: 20.adaptSize,
  //                     width: 20.adaptSize,
  //                     margin: EdgeInsets.only(right: 10.h),
  //                   ),
  //                   Text(
  //                     'Flat',
  //                     style: theme.textTheme.bodyLarge!.copyWith(
  //                       color: appTheme.gray800,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               height: 40.h,
  //               padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
  //               decoration: ShapeDecoration(
  //                 color: Colors.white,
  //                 shape: RoundedRectangleBorder(
  //                   side: BorderSide(width: 1.h, color: appTheme.gray300),
  //                   borderRadius: BorderRadius.circular(6.h),
  //                 ),
  //               ),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   CustomImageView(
  //                     imagePath: ImageConstant.imgIcSquarefeet,
  //                     height: 20.adaptSize,
  //                     width: 20.adaptSize,
  //                     margin: EdgeInsets.only(right: 10.h),
  //                   ),
  //                   Text(
  //                     'Square feet',
  //                     style: theme.textTheme.bodyLarge!.copyWith(
  //                       color: appTheme.gray800,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //       CustomElevatedButton(
  //           text: "lbl_search".tr,
  //           margin: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.v)),
  //     ],
  //   );
  // }

  Widget _buildRentTab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
          child: CustomTextFormField(
            controller: homeScreenController.searchRentController,
            hintText: "msg_search_location".tr,
            textInputAction: TextInputAction.done,
            prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 16.v, 12.h, 16.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgIcLocation,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(maxHeight: 56.v),
            contentPadding:
                EdgeInsets.only(top: 17.v, right: 30.h, bottom: 17.v),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTL16,
          ),
        ),
        CustomElevatedButton(
          text: "lbl_search".tr,
          margin: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.v),
          onPressed: () {
            String query = homeScreenController.searchRentController.text;
            if (query.isNotEmpty) {
              // Set the selected index to Explore and pass the query
              homeScreenContainerController.selectBottomMethod(1);
              homeScreenContainerController.searchQuery.value = query;
            }
          },
        ),
      ],
    );
  }
}
