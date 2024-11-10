import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

import 'controller/call_details_controller.dart';

class CallDetailsScreen extends GetWidget<CallDetailsController> {
  const CallDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      body: SafeArea(
        child: Container(
            width: double.maxFinite,
            height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40.v),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Spacer(flex: 43),
                  Padding(
                      padding: EdgeInsets.only(right: 0.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgEllipse225164x164,
                                height: 164.adaptSize,
                                width: 164.adaptSize,
                                radius: BorderRadius.circular(82.h),
                                margin: EdgeInsets.only(right: 18.h)),
                            SizedBox(height: 16.v),
                            Text("lbl_esther_howards".tr,
                                style: theme.textTheme.headlineMedium),
                            SizedBox(height: 11.v),
                            Text("lbl_13_35_min".tr,
                                style: CustomTextStyles.bodyLargeGray800)
                          ])),
                  // Spacer(flex: 56)
                ])),
      ),
      bottomNavigationBar: _buildActions(),
      // floatingActionButton: _buildFloatingActionButton()
    );
  }

  /// Section Widget
  Widget _buildActions() {
    return Padding(
        padding: EdgeInsets.only(left: 82.h, right: 0.h, bottom: 40.v),
        child: Row(children: [
          CustomIconButton(
              height: 58.adaptSize,
              width: 58.adaptSize,
              padding: EdgeInsets.all(16.h),
              decoration: IconButtonStyleHelper.fillGrayTL29,
              child: CustomImageView(
                  imagePath: ImageConstant.imgGroup29Gray90058x58)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.h),
              child: CustomIconButton(
                  height: 58.adaptSize,
                  width: 58.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  decoration: IconButtonStyleHelper.fillRed,
                  onTap: () {
                    onTapBtnIconButton();
                  },
                  child: CustomImageView(
                      imagePath: ImageConstant.imgGroup29Onprimarycontainer))),
          CustomIconButton(
              height: 58.adaptSize,
              width: 58.adaptSize,
              padding: EdgeInsets.all(16.h),
              decoration: IconButtonStyleHelper.fillGrayTL29,
              child: CustomImageView(imagePath: ImageConstant.imgGroup2958x58)),
        ]));
  }

  /// Section Widget
  // Widget _buildFloatingActionButton() {
  //   return CustomFloatingButton(
  //       height: 58,
  //       width: 58,
  //       backgroundColor: appTheme.gray10001,
  //       decoration: FloatingButtonStyleHelper.fillGrayTL29,
  //       child: CustomImageView(
  //           imagePath: ImageConstant.imgGroup2958x58,
  //           height: 29.0.v,
  //           width: 29.0.h));
  // }

  /// Navigates to the chatDetailsScreen when the action is triggered.
  onTapBtnIconButton() {
    Get.back();
    // Get.toNamed(
    //   AppRoutes.chatDetailsScreen,
    // );
  }
}
