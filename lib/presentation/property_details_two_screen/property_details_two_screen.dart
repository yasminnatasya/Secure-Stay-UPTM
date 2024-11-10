import '../property_details_two_screen/widgets/bedroomslist1_item_widget.dart';
import 'controller/property_details_two_controller.dart';
import 'models/bedroomslist1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_floating_button.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

class PropertyDetailsTwoScreen extends GetWidget<PropertyDetailsTwoController> {
  const PropertyDetailsTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: [
                  _buildImageStack(),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildTitleAndViewAll(
                          facilitiesText: "lbl_need_roommate".tr,
                          viewAllText: "lbl_40_mo".tr)),
                  SizedBox(height: 13.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("msg_thornridge_cir".tr,
                              style: CustomTextStyles.bodyLargeGray800))),
                  SizedBox(height: 17.v),
                  _buildBedroomsList(),
                  SizedBox(height: 15.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("msg_roommate_details".tr,
                              style: theme.textTheme.titleMedium))),
                  SizedBox(height: 15.v),
                  _buildNameColumn(),
                  SizedBox(height: 15.v),
                  _buildBookNowStack()
                ]))),
            floatingActionButton: _buildFloatingActionButton()));
  }

  /// Section Widget
  Widget _buildImageStack() {
    return SizedBox(
        height: 373.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle4429373x428,
              height: 373.v,
              width: 428.h,
              radius: BorderRadius.vertical(bottom: Radius.circular(12.h)),
              alignment: Alignment.center),
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.v),
                  decoration: AppDecoration.gradientBlackToBlack900,
                  child: CustomAppBar(
                      height: 36.v,
                      leadingWidth: 52.h,
                      leading: AppbarLeadingIconbutton(
                          imagePath: ImageConstant.imgGroup29Gray900,
                          margin: EdgeInsets.only(left: 16.h)),
                      actions: [
                        AppbarTrailingIconbuttonOne(
                            imagePath: ImageConstant.imgGroup29Gray90036x36,
                            margin: EdgeInsets.symmetric(horizontal: 16.h))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildBedroomsList() {
    return SizedBox(
        height: 92.v,
        child: Obx(() => ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: controller.propertyDetailsTwoModelObj.value
                .bedroomslist1ItemList.value.length,
            itemBuilder: (context, index) {
              Bedroomslist1ItemModel model = controller
                  .propertyDetailsTwoModelObj
                  .value
                  .bedroomslist1ItemList
                  .value[index];
              return Bedroomslist1ItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildNameColumn() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("lbl_name".tr,
                      style: CustomTextStyles.bodyMediumGray800),
                  SizedBox(height: 6.v),
                  Text("lbl_ronald_richards".tr,
                      style: theme.textTheme.bodyLarge)
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("lbl_smoke".tr,
                      style: CustomTextStyles.bodyMediumGray800),
                  SizedBox(height: 6.v),
                  Text("lbl_non_smoker".tr, style: theme.textTheme.bodyLarge)
                ])
              ]),
              SizedBox(height: 19.v),
              Padding(
                  padding: EdgeInsets.only(right: 30.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_gender".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray800),
                                  SizedBox(height: 6.v),
                                  Text("lbl_male".tr,
                                      style: theme.textTheme.bodyLarge)
                                ])),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_age".tr,
                                  style: CustomTextStyles.bodyMediumGray800),
                              SizedBox(height: 6.v),
                              Text("lbl_25_years".tr,
                                  style: theme.textTheme.bodyLarge)
                            ])
                      ])),
              SizedBox(height: 17.v),
              Padding(
                  padding: EdgeInsets.only(right: 11.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_occupation".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray800),
                                  SizedBox(height: 5.v),
                                  Text("lbl_banker".tr,
                                      style: theme.textTheme.bodyLarge)
                                ])),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_food_choice".tr,
                                  style: CustomTextStyles.bodyMediumGray800),
                              SizedBox(height: 8.v),
                              Text("lbl_veg".tr,
                                  style: theme.textTheme.bodyLarge)
                            ])
                      ])),
              SizedBox(height: 17.v),
              Padding(
                  padding: EdgeInsets.only(right: 44.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_pet".tr,
                                  style: CustomTextStyles.bodyMediumGray800),
                              SizedBox(height: 8.v),
                              Text("lbl_pet_friendly".tr,
                                  style: theme.textTheme.bodyLarge)
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_party".tr,
                                  style: CustomTextStyles.bodyMediumGray800),
                              SizedBox(height: 5.v),
                              Text("lbl_never".tr,
                                  style: theme.textTheme.bodyLarge)
                            ])
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildBookNowStack() {
    return SizedBox(
        height: 166.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    _buildTitleAndViewAll(
                        facilitiesText: "lbl_facilities".tr,
                        viewAllText: "lbl_view_all".tr,
                        onTapViewAll: () {
                          onTapTxtViewAll();
                        }),
                    SizedBox(height: 19.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      _buildFurniture(furniture: "lbl_wifi".tr),
                      Spacer(flex: 31),
                      _buildFurniture(furniture: "lbl_furniture".tr),
                      Spacer(flex: 31),
                      _buildFurniture(furniture: "lbl_elevator".tr),
                      Spacer(flex: 36),
                      Padding(
                          padding: EdgeInsets.only(top: 76.v, right: 5.h),
                          child: Text("lbl_students".tr,
                              style: theme.textTheme.bodyMedium))
                    ])
                  ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: AppDecoration.white,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 24.v),
                    CustomElevatedButton(
                        text: "lbl_book_now".tr,
                        onPressed: () {
                          onTapBookNow();
                        })
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildFloatingActionButton() {
    return CustomFloatingButton(
        height: 68,
        width: 68,
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        child: CustomImageView(
            imagePath: ImageConstant.imgGroup38147,
            height: 34.0.v,
            width: 34.0.h));
  }

  /// Common widget
  Widget _buildTitleAndViewAll({
    required String facilitiesText,
    required String viewAllText,
    Function? onTapViewAll,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(facilitiesText,
          style:
              theme.textTheme.titleMedium!.copyWith(color: appTheme.gray900)),
      GestureDetector(onTap: () {
        onTapViewAll!.call();
      }),
      Padding(
          padding: EdgeInsets.only(top: 3.v, bottom: 2.v),
          child: Text(viewAllText,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: appTheme.gray900)))
    ]);
  }

  /// Common widget
  Widget _buildFurniture({required String furniture}) {
    return Column(children: [
      CustomIconButton(
          height: 68.adaptSize,
          width: 68.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillOnPrimaryContainerTL34,
          child: CustomImageView(imagePath: ImageConstant.imgGroup38145)),
      SizedBox(height: 8.v),
      Text(furniture,
          style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray900))
    ]);
  }

  /// Navigates to the facilitiesScreen when the action is triggered.
  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.facilitiesScreen,
    );
  }

  /// Navigates to the bookingDetailsScreen when the action is triggered.
  onTapBookNow() {
    Get.toNamed(
      AppRoutes.bookingDetailsScreen,
    );
  }
}
