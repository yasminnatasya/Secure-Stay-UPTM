import 'controller/privacy_policy_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PrivacyPolicyController privacyPolicyController =
      Get.put(PrivacyPolicyController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.white,
      body: SafeArea(
        child: Container(
          color: appTheme.gray100,
          width: double.maxFinite,
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 12.v),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 17.v,
                  ),
                  decoration: AppDecoration.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "msg_1_types_of_data".tr,
                        style: CustomTextStyles.titleMediumSFProDisplay,
                      ),
                      SizedBox(height: 5.v),
                      Text(
                        "msg_duis_tristique_diam".tr,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style:
                            CustomTextStyles.bodyLargeSFProDisplay_2.copyWith(
                          height: 1.19,
                        ),
                      ),
                      SizedBox(height: 21.v),
                      Text(
                        "msg_2_use_of_your_personal".tr,
                        style: CustomTextStyles.titleLargeSFProDisplay,
                      ),
                      SizedBox(height: 13.v),
                      Text(
                        "msg_sed_sollicitudin".tr,
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style:
                            CustomTextStyles.bodyLargeSFProDisplay_2.copyWith(
                          height: 1.19,
                        ),
                      ),
                      SizedBox(height: 42.v),
                      Text(
                        "msg_3_disclosure_of".tr,
                        style: CustomTextStyles.titleLargeSFProDisplay,
                      ),
                      SizedBox(height: 13.v),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_sed_sollicitudin3".tr,
                              style: CustomTextStyles.bodyLargeSFProDisplay_1,
                            ),
                            TextSpan(
                              text: "msg_maecenas_egestas".tr,
                              style: CustomTextStyles.bodyLargeSFProDisplay_1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5.v),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(
        top: 18.v,
        bottom: 19.v,
      ),
      decoration: AppDecoration.outlineGray300,
      child: CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
          onTap: () {
            Get.back();
          },
          imagePath: ImageConstant.imgIcArrowLeft,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 2.v,
            bottom: 5.v,
          ),
        ),
        centerTitle: true,
        title: AppbarSubtitle(
          text: "lbl_privacy_policy".tr,
        ),
      ),
    );
  }
}
