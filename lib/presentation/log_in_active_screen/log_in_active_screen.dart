import 'controller/log_in_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/core/utils/validation_functions.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class LogInActiveScreen extends StatefulWidget {
  const LogInActiveScreen({super.key});

  @override
  State<LogInActiveScreen> createState() => _LogInActiveScreenState();
}

class _LogInActiveScreenState extends State<LogInActiveScreen> {
  final LogInActiveController logInActiveController =
      Get.put(LogInActiveController()); // Ensure it reinitializes

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: appTheme.white,
        bottomNavigationBar: GestureDetector(
          onTap: () {
            onTapSignUpButton();
          },
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "msg_don_t_have_an_account2".tr,
                    style: theme.textTheme.bodyLarge),
                TextSpan(
                    text: "lbl_sign_up".tr,
                    style: CustomTextStyles.titleMediumBold)
              ]),
              textAlign: TextAlign.center),
        ).marginOnly(bottom: 40.v),
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(children: [
                    SizedBox(height: 40.h),
                    Expanded(
                      child: ListView(
                        primary: true,
                        shrinkWrap: false,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("lbl_log_in".tr,
                                  style: theme.textTheme.headlineMedium)),
                          SizedBox(height: 8.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("msg_your_account_is".tr,
                                  style: theme.textTheme.bodyLarge)),
                          SizedBox(height: 16.v),
                          _buildMasterUsername(),
                          SizedBox(height: 16.v),
                          _buildMasterUsername1(),
                          SizedBox(height: 16.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPassword();
                                  },
                                  child: Text("msg_forgot_password".tr,
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(color: appTheme.gray900)))),
                          SizedBox(height: 30.v),
                          _buildLoginButton(),
                          SizedBox(height: 26.v),
                          // SizedBox(
                          //   height: 24.v,
                          //   child:
                          //       Stack(alignment: Alignment.center, children: [
                          //     Align(
                          //         alignment: Alignment.topCenter,
                          //         child: Padding(
                          //             padding: EdgeInsets.only(top: 11.v),
                          //             child: SizedBox(
                          //                 width: 314.h, child: Divider()))),
                          //     // _buildOrContinueWithButton()
                          //   ]),
                          // ),
                          SizedBox(height: 26.v),
                          // _buildSocial(),
                          SizedBox(height: 26.v),
                        ],
                      ),
                    ),
                  ]))),
        ));
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
        controller: logInActiveController.emailFieldController,
        hintText: "Enter your email address",
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "Please enter a valid email address";
          }
          return null;
        });
  }

  Widget _buildPasswordField() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: logInActiveController.passwordFieldController,
              hintText: "Enter your password",
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid password";
                }
                return null;
              },
              suffix: GestureDetector(
                onTap: () {
                  logInActiveController.togglePasswordVisibility();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 15.v),
                  child: CustomImageView(
                      imagePath: logInActiveController.isShowPassword.value
                          ? ImageConstant.imgIcEye
                          : ImageConstant.imgEye,
                      height: 24.adaptSize,
                      width: 24.adaptSize),
                ),
              ),
              suffixConstraints: BoxConstraints(maxHeight: 54.v),
              obscureText: logInActiveController.isShowPassword.value,
            ),
            SizedBox(height: 8.v),
            if (logInActiveController.errorMessage.value.isNotEmpty)
              Text(
                logInActiveController.errorMessage.value,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
          ],
        ));
  }

  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email_address".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 8.v),
      _buildEmailField()
    ]);
  }

  Widget _buildMasterUsername1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_password".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 8.v),
      _buildPasswordField()
    ]);
  }

  Widget _buildLoginButton() {
    return Obx(() {
      if (logInActiveController.remainingCooldown.value > Duration.zero) {
        // Show cooldown timer
        return Column(
          children: [
            Text(
              'Login disabled. Try again in ${logInActiveController.remainingCooldown.value.inMinutes}m ${logInActiveController.remainingCooldown.value.inSeconds % 60}s',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 10),
          ],
        );
      }

      // Show login button if no cooldown
      return CustomElevatedButton(
        text:
            logInActiveController.isLoading.value ? "Logging in..." : "Log In",
        onPressed: () {
          if (_formKey.currentState!.validate() &&
              !logInActiveController.isLoading.value) {
            logInActiveController.loginUser(); // Call the login function
          }
        },
      );
    });
  }

  // Widget _buildOrContinueWithButton() {
  //   return CustomElevatedButton(
  //       height: 24.v,
  //       width: 128.h,
  //       text: "msg_or_continue_with".tr,
  //       buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
  //       buttonTextStyle: CustomTextStyles.bodyLargeSFProDisplay,
  //       alignment: Alignment.center);
  // }

  // Widget _buildSocial() {
  //   return Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 8.h),
  //       child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [_buildGoogleButton()]));
  // }

  // Widget _buildGoogleButton() {
  //   return Expanded(
  //       child: CustomElevatedButton(
  //           height: 54.v,
  //           text: "lbl_google".tr,
  //           margin: EdgeInsets.only(right: 8.h),
  //           leftIcon: Container(
  //               margin: EdgeInsets.only(right: 12.h),
  //               child: CustomImageView(
  //                   imagePath: ImageConstant.imgIcGoogle,
  //                   height: 24.adaptSize,
  //                   width: 24.adaptSize)),
  //           buttonStyle: CustomButtonStyles.fillGray,
  //           buttonTextStyle: CustomTextStyles.titleMediumSFProDisplay16,
  //           onPressed: () {
  //             onTapGoogleButton();
  //           }));
  // }

  onTapSignUpButton() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  onTapGoogleButton() {
    Get.offAllNamed(AppRoutes.homeScreenContainerScreen);
  }

  onTapTxtForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }
}
