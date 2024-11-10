import 'package:uptm_secure_stay/presentation/home_screen_container_screen/controller/home_screen_container_controller.dart';

import 'controller/log_out_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class LogOutDialog extends StatelessWidget {
  LogOutDialog(this.controller, {Key? key}) : super(key: key);

  LogOutController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 376.h,
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 24.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("msg_are_you_sure_you2".tr,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 25.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: CustomOutlinedButton(
                        height: 56.v,
                        text: "lbl_cancel".tr,
                        margin: EdgeInsets.only(right: 10.h),
                        buttonTextStyle:
                            CustomTextStyles.titleMediumPrimaryContainer,
                        onPressed: () {
                          onTapCancel();
                        })),
                Expanded(
                    child: CustomElevatedButton(
                        text: "lbl_log_out".tr,
                        onPressed: () {
                          onTapLogOut();
                        },
                        margin: EdgeInsets.only(left: 10.h)))
              ])
            ]));
  }

  /// Navigates to the profile1Screen when the action is triggered.
  onTapCancel() {
    Get.back();
  }

  onTapLogOut() {
    SharedPreferencesClass setHome = SharedPreferencesClass();
    setHome.setData(false, true);

    HomeScreenContainerController homeScreenContainerController =
        Get.find<HomeScreenContainerController>();

    homeScreenContainerController.selectBottomMethod(0);

    Get.toNamed(
      AppRoutes.logInActiveScreen,
    );
  }
}
