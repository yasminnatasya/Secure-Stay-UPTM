import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';
import 'controller/videocall_details_controller.dart';

class VideocallDetailsScreen extends GetWidget<VideocallDetailsController> {
  const VideocallDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                image: DecorationImage(
                    image: AssetImage(ImageConstant.img05VideocallDetails),
                    fit: BoxFit.cover)),
            child: SizedBox(
                width: double.maxFinite,
                child: SizedBox(
                    height: double.infinity,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgSmallImage,
                          height: 169.v,
                          width: 140.h,
                          radius: BorderRadius.circular(12.h),
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: 19.h, bottom: 141.v)),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.h, vertical: 40.v),
                              // decoration:
                              //     AppDecoration.gradientBlackToBlack9001,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                        height: 58.adaptSize,
                                        width: 58.adaptSize,
                                        padding: EdgeInsets.all(16.h),
                                        decoration:
                                            IconButtonStyleHelper.fillGrayTL29,
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgGroup29Gray90058x58)),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 45.h,
                                        ),
                                        child: CustomIconButton(
                                            height: 58.adaptSize,
                                            width: 58.adaptSize,
                                            padding: EdgeInsets.all(6.h),
                                            decoration:
                                                IconButtonStyleHelper.fillRed,
                                            onTap: () {
                                              onTapBtnIconButton();
                                            },
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgGroup29Onprimarycontainer))),
                                    CustomIconButton(
                                        height: 58.adaptSize,
                                        width: 58.adaptSize,
                                        padding: EdgeInsets.all(16.h),
                                        decoration:
                                            IconButtonStyleHelper.fillGrayTL29,
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGroup2958x58)),
                                  ])))
                    ])))),
      ),
      // floatingActionButton: _buildFloatingActionButton()
    );
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
