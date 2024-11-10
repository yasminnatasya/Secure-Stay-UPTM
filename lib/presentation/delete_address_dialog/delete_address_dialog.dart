import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class DeleteAddressDialog extends StatelessWidget {
  DeleteAddressDialog({Key? key}) : super(key: key);

  //DeleteAddressController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 376.h,
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 24.v),
        decoration: AppDecoration.white.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("msg_are_you_sure_you".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleMediumBold16
                      .copyWith(height: 1.50.v)),
              SizedBox(height: 24.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: CustomOutlinedButton(
                        height: 56.v,
                        text: "lbl_no".tr,
                        margin: EdgeInsets.only(right: 10.h),
                        buttonTextStyle:
                            CustomTextStyles.titleMediumPrimaryContainer,
                        onPressed: () {
                          onTapNo();
                        })),
                Expanded(
                    child: CustomElevatedButton(
                        text: "lbl_yes".tr,
                        margin: EdgeInsets.only(left: 10.h),
                        onPressed: () {
                          onTapYes();
                        }))
              ])
            ]));
  }

  /// Navigates to the myAddressScreen when the action is triggered.
  onTapNo() {
    Get.back();
  }

  /// Navigates to the myAddressScreen when the action is triggered.
  onTapYes() {
    Get.back();
  }
}
