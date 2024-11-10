import 'controller/reset_password_success_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordSuccessDialog extends StatelessWidget {
  ResetPasswordSuccessDialog(this.controller, {Key? key}) : super(key: key);

  ResetPasswordSuccessController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 396.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              height: 120.adaptSize,
              width: 120.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 37.h, vertical: 28.v),
              decoration: AppDecoration.fillBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder60),
              child: CustomImageView(
                  imagePath: ImageConstant.imgXmlid505,
                  height: 64.v,
                  width: 44.h,
                  alignment: Alignment.center)),
          SizedBox(height: 9.v),
          Text("msg_password_updated".tr, style: theme.textTheme.headlineSmall),
          SizedBox(height: 16.v),
          Text("msg_you_have_successfully".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge!.copyWith(height: 1.50.v)),
          SizedBox(height: 40.v),
          CustomElevatedButton(
              height: 53.v,
              text: "lbl_go_to_log_in".tr,
              margin: EdgeInsets.symmetric(horizontal: 57.h),
              onPressed: () {
                onTapGoToLogIn();
              })
        ]));
  }

  /// Navigates to the logInActiveScreen when the action is triggered.
  onTapGoToLogIn() {
    Get.toNamed(
      AppRoutes.logInActiveScreen,
    );
  }
}
