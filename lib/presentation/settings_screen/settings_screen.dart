import 'package:uptm_secure_stay/main.dart';
import 'package:uptm_secure_stay/presentation/log_in_active_screen/controller/log_in_active_controller.dart';
import 'package:uptm_secure_stay/widgets/restart_widget.dart';

import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsController settingsController =
      Get.put(SettingsController(), permanent: true);

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
          child: Column(
            children: [
              _buildHeader(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                child: Column(
                  children: [
                    _buildSetting(
                      ImageConstant.imgIcNotification,
                      "Notifications",
                      onTap: () {
                        Get.toNamed(AppRoutes.notificationsScreen);
                      },
                    ),
                    // SizedBox(height: 16.v),
                    // _buildSetting(
                    //   ImageConstant.imgIcLocation,
                    //   "My address",
                    //   onTap: () {
                    //     Get.toNamed(AppRoutes.myAddressScreen);
                    //   },
                    // ),
                    SizedBox(height: 16.v),
                    _buildSetting(
                      ImageConstant.imgIcPrivacy,
                      "Privacy policy",
                      onTap: () {
                        Get.toNamed(AppRoutes.privacyPolicyScreen);
                      },
                    ),
                    SizedBox(height: 16.v),
                    _buildSetting(
                      ImageConstant.imgIcLogout,
                      "Log out",
                      onTap: () {
                        onTapProfileRow();
                      },
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          margin: EdgeInsets.only(left: 20.h, top: 2.v, bottom: 5.v),
        ),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_settings".tr),
      ),
    );
  }

  Widget _buildSetting(String image, String name, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.v,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: image,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
            SizedBox(width: 16.h),
            Text(
              name,
              style: TextStyle(
                color: appTheme.gray900,
                fontSize: 16.fSize,
                fontFamily: 'Neutrif Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgIcArrowRight,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
          ],
        ),
      ),
    );
  }

  void onTapProfileRow() {
    Get.dialog(
      AlertDialog(
        title: Text('Confirm Log Out'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await _logOutUser();

              // Redirect to the login page, clearing all previous routes
              Get.offAllNamed(AppRoutes.logInActiveScreen);
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }

  Future<void> _logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Firebase sign-out successful.");
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
