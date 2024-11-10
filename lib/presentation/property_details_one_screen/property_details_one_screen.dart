import 'package:expandable_text/expandable_text.dart';
import 'package:uptm_secure_stay/presentation/property_details_one_screen/models/property_details_one_model.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/widgets/bedroomslist_item_widget.dart';

import 'controller/property_details_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

class PropertyDetailsOneScreen extends StatefulWidget {
  const PropertyDetailsOneScreen({super.key});

  @override
  State<PropertyDetailsOneScreen> createState() =>
      _PropertyDetailsOneScreenState();
}

class _PropertyDetailsOneScreenState extends State<PropertyDetailsOneScreen> {
  PropertyDetailsOneController propertyDetailsOneController =
      Get.put(PropertyDetailsOneController());
  PageController pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        color: appTheme.gray100,
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: false,
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
                            Text('Private party new york',
                                style: theme.textTheme.titleLarge),
                            SizedBox(
                              height: 8.v,
                            ),
                            Text(
                              'Thornridge cir. syracuse, connecticut ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: appTheme.gray800,
                                letterSpacing: 0.16,
                              ),
                            )
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '\$40',
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: appTheme.redA200,
                                  )),
                              TextSpan(
                                  text: '/mo',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: appTheme.redA200,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.v),
                  SizedBox(
                    height: 93.v,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      itemCount: bedListItemList.length,
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
                              imagePath: bedListItemList[index].image,
                              height: 26.adaptSize,
                              width: 26.adaptSize,
                            ),
                            SizedBox(
                              height: 18.v,
                            ),
                            Text(
                              bedListItemList[index].tittle,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  // _buildBedroomsList(),
                  SizedBox(height: 24.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("msg_property_description".tr,
                              style: theme.textTheme.titleMedium))),
                  SizedBox(height: 12.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: ExpandableText(
                      "A multi-family home, also known as a duplex. triplex,or multi-unit building. is a residential property that living A multi-family home, also known as a duplex. triplex,or multi-unit building. is a residential property thatliving ",
                      expandText: "lbl_read_more".tr,
                      collapseText: 'show less',
                      maxLines: 3,
                      style:
                          theme.textTheme.bodyLarge!.copyWith(height: 1.50.v),
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
                        Text('Facilities', style: theme.textTheme.titleMedium),
                        GestureDetector(
                          onTap: () {
                            onTapTxtViewAll();
                          },
                          child: Text('View all',
                              textAlign: TextAlign.right,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                letterSpacing: 0.14,
                              )),
                        )
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
                  text: "lbl_book_now".tr,
                  onPressed: () {
                    onTapBookNow();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildImageStack() {
    return SizedBox(
        height: 373.v,
        width: double.maxFinite,
        child: Stack(children: [
          PageView.builder(
            itemCount: 2,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return CustomImageView(
                  imagePath: ImageConstant.imgBg,
                  height: 373.v,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  radius: BorderRadius.vertical(bottom: Radius.circular(12.h)),
                  alignment: Alignment.center);
            },
          ),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(7.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgGroup29Gray900,
                            height: 22.0.v,
                            width: 22.0.h),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(7.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgGroup29Gray90036x36,
                            height: 22.0.v,
                            width: 22.0.h),
                      ),
                    ),
                  ],
                ),
                Container(
                    width: 70.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 9.v),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(24.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${currentPage + 1} / 2",
                            style: theme.textTheme.bodyLarge),
                      ],
                    )),
              ],
            ),
          ),
        ]));
  }

  ///   /// Common widget
  Widget _buildFurniture(
      {required String userLabel,
      required String image,
      required Color backColor}) {
    return Column(children: [
      CustomIconButton(
          height: 68.adaptSize,
          width: 68.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillOnPrimaryContainerTL34.copyWith(
            color: backColor,
          ),
          child: CustomImageView(imagePath: image)),
      SizedBox(height: 8.v),
      Text(userLabel,
          style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray900))
    ]);
  }
}

///
///
/// Common widget

/// Navigates to the facilitiesScreen when the action is triggered.
onTapTxtViewAll() {
  Get.bottomSheet(
      isDismissible: false, FacilitiesViewAll(), isScrollControlled: true);
}

/// Navigates to the bookingDetailsScreen when the action is triggered.
onTapBookNow() {
  Get.toNamed(
    AppRoutes.bookingDetailsScreen,
  );
}
