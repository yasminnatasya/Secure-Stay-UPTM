import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

class AddPropertyBottomSheet extends StatelessWidget {
  AddPropertyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.white.copyWith(
        color: Colors.white,
        borderRadius: BorderRadiusStyle.customBorderTL32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: 70.h,
                    height: 5.v,
                    margin: EdgeInsets.only(top: 15.v),
                    decoration: ShapeDecoration(
                      color: appTheme.gray300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.h),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.v, bottom: 16.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Property type',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: appTheme.black20,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoutes.addPropertyHomeScreen);
                            },
                            child: Container(
                              height: 129.v,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Color(0xFFDAE9FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.h),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(11.h),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: OvalBorder(),
                                    ),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.homeBlue,
                                      height: 32.adaptSize,
                                      width: 32.adaptSize,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.v,
                                  ),
                                  Text(
                                    'Home',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 18.h,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoutes
                                  .addPropertyDetailsForRoommateScreen);
                            },
                            child: Container(
                              height: 129.v,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Color(0xFFDBF3E7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.h),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(11.h),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: OvalBorder(),
                                    ),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.friendsGreen,
                                      height: 32.adaptSize,
                                      width: 32.adaptSize,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.v,
                                  ),
                                  Text(
                                    'Roommate',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 16.v,
                right: 16.h,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    padding: EdgeInsets.all(7.h),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIcClose,
                      height: 22.adaptSize,
                      width: 22.adaptSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
