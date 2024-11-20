import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  ProfileController controller = Get.put(
      ProfileController(ProfileModel(name: '', email: '', studentId: '').obs));

  bool isStudentIdVisible = false; // Visibility toggle state

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
                // Display Name
                Text(profile.name,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium),
                SizedBox(height: 4.v),
                // Display Email
                Text(profile.email,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge),
                SizedBox(height: 4.v),
                // Display Student ID Section
                _buildStudentIdSection(profile),
                SizedBox(height: 24.v),
                // Add Privacy Control Section
                _buildPrivacyControl(profile),
                SizedBox(height: 16.v),
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

  Widget _buildStudentIdSection(ProfileModel profile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Student ID: ",
          style: theme.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: appTheme.gray800,
          ),
        ),
        SizedBox(width: 8.h),
        // Show or hide student ID
        Text(
          isStudentIdVisible ? profile.studentId : "**** **** ****",
          style: theme.textTheme.bodyLarge,
        ),
        SizedBox(width: 8.h),
        GestureDetector(
          onTap: () {
            setState(() {
              isStudentIdVisible = !isStudentIdVisible;
            });
          },
          child: Icon(
            isStudentIdVisible ? Icons.visibility_off : Icons.visibility,
            color: appTheme.gray800,
          ),
        ),
      ],
    );
  }

  Widget _buildPrivacyControl(ProfileModel profile) {
    return Padding(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Display Email on Property Details",
              style: theme.textTheme.bodyLarge,
            ),
            Switch(
              value: profile.displayEmail,
              onChanged: (newValue) {
                setState(() {
                  profile.displayEmail = newValue;
                });
                updateEmailVisibility(newValue); // Save preference to Firestore
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateEmailVisibility(bool isVisible) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .update({'displayEmail': isVisible});
        print("Email visibility updated: $isVisible");
      }
    } catch (e) {
      print("Failed to update email visibility: $e");
    }
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
