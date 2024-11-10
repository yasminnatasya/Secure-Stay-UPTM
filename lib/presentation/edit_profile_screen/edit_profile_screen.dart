import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/core/utils/validation_functions.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());

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
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 40.v),
                    child: Column(children: [
                      SizedBox(
                          height: 100.adaptSize,
                          width: 100.adaptSize,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgEllipse225100x100,
                                    height: 100.adaptSize,
                                    width: 100.adaptSize,
                                    radius: BorderRadius.circular(50.h),
                                    alignment: Alignment.center),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 4.v),
                                    child: CustomIconButton(
                                        height: 28.adaptSize,
                                        width: 28.adaptSize,
                                        padding: EdgeInsets.all(5.h),
                                        alignment: Alignment.bottomRight,
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgGroup29Gray90028x28)))
                              ])),
                      SizedBox(height: 39.v),
                      _buildMasterUsername(),
                      SizedBox(height: 15.v),
                      _buildEmailAddress(),
                      SizedBox(height: 15.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("lbl_phone_number".tr,
                              style: theme.textTheme.bodyLarge)),
                      SizedBox(height: 7.v),
                      phoneNumberField(
                        editProfileController.phoneNumberController,
                        (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Enter valid number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5.v)
                    ]))
              ])),
        ),
        bottomNavigationBar: _buildBtnAndBg());
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
            title: AppbarSubtitle(text: "lbl_edit_profile".tr)));
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_full_name2".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      CustomTextFormField(
        controller: editProfileController.fullNameController,
        hintText: "lbl_ronald_richards".tr,
        enableBorder: false,
      ),
    ]);
  }

  /// Section Widget
  Widget _buildEmailAddress() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email_address".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 8.v),
      CustomTextFormField(
          controller: editProfileController.emailController,
          hintText: "msg_ronaldrichards_gmail_com".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.emailAddress,
          enableBorder: false,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          })
    ]);
  }

  /// Section Widget
  Widget _buildBtnAndBg() {
    return Container(
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v),
        decoration: AppDecoration.white,
        child: CustomElevatedButton(
            text: "lbl_submit".tr,
            onPressed: () {
              onTapSubmit();
            }));
  }

  /// Navigates to the profile1Screen when the action is triggered.
  onTapSubmit() {
    Get.back();
  }
}
