import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';

class PropertyAddSuccessDialog extends StatelessWidget {
  const PropertyAddSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Center(
      child: Container(
        width: 396.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 120.adaptSize,
              width: 120.adaptSize,
              padding: EdgeInsets.all(28.h),
              decoration: AppDecoration.fillBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder60),
              child: CustomImageView(
                imagePath: ImageConstant.imgVectorPrimarycontainer,
                height: 64.adaptSize,
                width: 64.adaptSize,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 9.v),
            Text("msg_property_add_success".tr,
                style: theme.textTheme.headlineSmall),
            SizedBox(height: 16.v),
            Text(
              "msg_you_have_successfully4".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge!.copyWith(height: 1.50.v),
            ),
            SizedBox(height: 40.v),
            CustomElevatedButton(
              height: 53.v,
              text: "lbl_go_to_home".tr,
              margin: EdgeInsets.symmetric(horizontal: 57.h),
              onPressed: () {
                onTapGoToHome();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the home screen when the action is triggered.
  void onTapGoToHome() {
    Get.toNamed(AppRoutes.homeScreenContainerScreen);
  }
}
