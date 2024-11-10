import 'controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';
import 'package:uptm_secure_stay/presentation/reset_password_success_dialog/reset_password_success_dialog.dart';
import 'package:uptm_secure_stay/presentation/reset_password_success_dialog/controller/reset_password_success_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.white,
        body: SafeArea(
          child: SizedBox(
              width: double.maxFinite,
              child: Form(
                key: _formKey,
                child: Column(children: [
                  _buildHeader(),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 12.v),
                      child: Column(children: [
                        Container(
                            width: 348.h,
                            margin: EdgeInsets.only(left: 21.h, right: 25.h),
                            child: Text("msg_you_re_just_moments".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodyLargeSFProDisplay
                                    .copyWith(height: 1.50.v))),
                        SizedBox(height: 16.v),
                        _buildMasterUsername(),
                        SizedBox(height: 16.v),
                        _buildMasterUsername1(),
                        SizedBox(height: 30.v),
                        CustomElevatedButton(
                            text: "lbl_reset_password".tr,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                onTapResetPassword();
                              }
                            }),
                        SizedBox(height: 5.v)
                      ]))
                ]),
              )),
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
            title: AppbarSubtitle(text: "lbl_reset_password".tr)));
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_new_password".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 6.v),
      Obx(() => CustomTextFormField(
          controller: resetPasswordController.newPasswordController,
          hintText: "Enter your  new password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a valid new password";
            }
            return null;
          },
          suffix: GestureDetector(
              onTap: () {
                resetPasswordController.isShowPassword.value =
                    !resetPasswordController.isShowPassword.value;
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 15.v),
                  child: CustomImageView(
                      imagePath: resetPasswordController.isShowPassword.value
                          ? ImageConstant.imgIcEye
                          : ImageConstant.imgEye,
                      height: 24.adaptSize,
                      width: 24.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 54.v),
          obscureText: resetPasswordController.isShowPassword.value))
    ]);
  }

  /// Section Widget
  Widget _buildMasterUsername1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_retype_password".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 6.v),
      Obx(() => CustomTextFormField(
          controller: resetPasswordController.passwordController,
          hintText: "Enter your  retype password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a valid  retype password";
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          suffix: GestureDetector(
              onTap: () {
                resetPasswordController.isShowPassword1.value =
                    !resetPasswordController.isShowPassword1.value;
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 15.v),
                  child: CustomImageView(
                      imagePath: resetPasswordController.isShowPassword1.value
                          ? ImageConstant.imgIcEye
                          : ImageConstant.imgEye,
                      height: 24.adaptSize,
                      width: 24.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 54.v),
          obscureText: resetPasswordController.isShowPassword1.value))
    ]);
  }

  /// Displays a dialog with the [ResetPasswordSuccessDialog] content.
  onTapResetPassword() {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.h),
      content: ResetPasswordSuccessDialog(
        Get.put(
          ResetPasswordSuccessController(),
        ),
      ),
    ));
  }
}
