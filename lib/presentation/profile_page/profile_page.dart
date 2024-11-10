import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller =
      Get.put(ProfileController(ProfileModel(name: '', email: '').obs));
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          final profile = controller.profileModelObj.value;
          return Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillGray,
            child: Column(
              children: [
                _buildHeader(),
                SizedBox(height: 40.v),
                CustomImageView(
                  imagePath: ImageConstant.imgAvtar1,
                  height: 100.adaptSize,
                  width: 100.adaptSize,
                ),
                SizedBox(height: 16.v),
                Text(profile.name,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium),
                SizedBox(height: 4.v),
                Text(profile.email,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge),
                SizedBox(height: 24.v),
                _buildProfileEditText1(),
                SizedBox(height: 16.v),
                _buildProfileEditText2(),
                SizedBox(height: 16.v),
                _buildProfileEditText3(),
                SizedBox(height: 16.v),
                _buildProfileEditText5(),
                SizedBox(height: 5.v),
              ],
            ),
          );
        }),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
      decoration: AppDecoration.outlineGray10001,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "lbl_profile".tr,
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileEditText1() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.myProfileScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
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
                imagePath: ImageConstant.imgIcUser,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              SizedBox(
                width: 16.h,
              ),
              Text('My profile', style: theme.textTheme.bodyLarge),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgIcArrowRight,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileEditText2() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.favoriteScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
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
                imagePath: ImageConstant.imgLike,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              SizedBox(
                width: 16.h,
              ),
              Text('Favorite', style: theme.textTheme.bodyLarge),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgIcArrowRight,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileEditText3() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.myPropertyScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
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
                imagePath: ImageConstant.imgIcFlatGray900,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              SizedBox(
                width: 16.h,
              ),
              Text(
                'My property',
                style: theme.textTheme.bodyLarge,
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
      ),
    );
  }

  /// Section Widget
  // Widget _buildProfileEditText4() {
  //   return GestureDetector(
  //     onTap: () {
  //       Get.toNamed(AppRoutes.myCardsScreen);
  //     },
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 16.h),
  //       child: Container(
  //         height: 56.v,
  //         padding: EdgeInsets.symmetric(horizontal: 16.h),
  //         decoration: ShapeDecoration(
  //           color: Colors.white,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //         ),
  //         child: Row(
  //           children: [
  //             CustomImageView(
  //               imagePath: ImageConstant.imgIcCard,
  //               height: 24.adaptSize,
  //               width: 24.adaptSize,
  //             ),
  //             SizedBox(
  //               width: 16.h,
  //             ),
  //             Text(
  //               'My cards',
  //               style: theme.textTheme.bodyLarge,
  //             ),
  //             Spacer(),
  //             CustomImageView(
  //               imagePath: ImageConstant.imgIcArrowRight,
  //               height: 20.adaptSize,
  //               width: 20.adaptSize,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildProfileEditText5() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.settingsScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
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
                imagePath: ImageConstant.imgIcSetting,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              SizedBox(
                width: 16.h,
              ),
              Text(
                'Settings',
                style: theme.textTheme.bodyLarge,
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
      ),
    );
  }
}
