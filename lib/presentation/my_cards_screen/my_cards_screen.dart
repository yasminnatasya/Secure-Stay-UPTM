import 'controller/my_cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_trailing_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';

class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({super.key});

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  MyCardsController myCardsController = Get.put(MyCardsController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: appTheme.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              color: appTheme.gray100,
              width: double.maxFinite,
              child: Column(children: [
                _buildHeader(),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                    child: Column(children: [
                      _buildPaymentDetails("Paypal", ImageConstant.imgIcPaypal),
                      SizedBox(height: 16.v),
                      _buildPaymentDetails(
                          "Visa", ImageConstant.imgRemixiconsLineLogosVisaline),
                      SizedBox(height: 16.v),
                      _buildPaymentDetails("Apple pay", ImageConstant.imgApple),
                      SizedBox(height: 16.v),
                      _buildPaymentDetails(
                          "Google pay", ImageConstant.imgIcGoogle),
                      SizedBox(height: 5.v)
                    ]))
              ])),
        ));
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
            title: AppbarSubtitle(text: "lbl_my_cards".tr),
            actions: [
              AppbarTrailingImage(
                  imagePath: ImageConstant.add,
                  margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v),
                  onTap: () {
                    onTapIcAdd();
                  })
            ]));
  }

  /// Common widget
  Widget _buildPaymentDetails(String name, String image) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Row(children: [
          CustomImageView(
              imagePath: image, height: 34.adaptSize, width: 34.adaptSize),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 5.v, bottom: 4.v),
              child: Text(name, style: theme.textTheme.titleMedium))
        ]));
  }

  /// Navigates to the addNewCardScreen when the action is triggered.
  onTapIcAdd() {
    Get.toNamed(
      AppRoutes.addNewCardScreen,
    );
  }
}
