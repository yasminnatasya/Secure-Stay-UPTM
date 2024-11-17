import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.white,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    _buildHeader(),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 10.v),
                        child: Column(children: [
                          Text("msg_you_re_just_moments".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyLargeSFProDisplay
                                  .copyWith(height: 1.50.v)),
                          SizedBox(height: 16.v),
                          _buildMasterUsername(),
                          SizedBox(height: 30.v),
                          CustomElevatedButton(
                              text: "lbl_send".tr,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  onTapSend();
                                }
                              }),
                          SizedBox(height: 5.v)
                        ]))
                  ]))),
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
            title: AppbarSubtitle(text: "lbl_forgot_password".tr)));
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email_address".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 8.v),
      CustomTextFormField(
          controller: forgotPasswordController.emailController,
          hintText: "Enter your email address",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a valid email address";
            }
            return null;
          })
    ]);
  }

  /// Trigger password reset email sending when the action is triggered.
  void onTapSend() {
    forgotPasswordController.sendPasswordResetEmail();
  }
}
