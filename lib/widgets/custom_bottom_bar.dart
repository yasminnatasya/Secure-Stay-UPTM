// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/add_property_bottomsheet/add_property_bottomsheet.dart';

import '../presentation/home_screen_container_screen/controller/home_screen_container_controller.dart';

class CustomBottomBar extends StatefulWidget {
  Function(BottomBarEnum)? onChanged;

  CustomBottomBar({super.key, this.onChanged});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  HomeScreenContainerController homeScreenContainerController =
      Get.put(HomeScreenContainerController());

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: "assets/images/home.svg",
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavExploreGray800,
      activeIcon: "assets/images/explore green.svg",
      title: "lbl_explore".tr,
      type: BottomBarEnum.Explore,
    ),
    BottomMenuModel(
      icon: ImageConstant.add,
      activeIcon: ImageConstant.add,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
      isCircle: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavChats,
      activeIcon: "assets/images/chat green.svg",
      title: "lbl_chats".tr,
      type: BottomBarEnum.Chats,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: "assets/images/profile green.svg",
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // height: 100.v,
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withOpacity(0.03),
              spreadRadius: 2.h,
              blurRadius: 16.h,
              offset: Offset(
                0,
                -6,
              ),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: homeScreenContainerController.selectIndex.value,
          onTap: (value) {
            if (value == 2) {
              showModalBottomSheet(
                backgroundColor: appTheme.bgColor,
                context: context,
                isScrollControlled: false,
                useSafeArea: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.h),
                        topRight: Radius.circular(24.h))),
                builder: (context) {
                  return AddPropertyBottomSheet();
                },
              );
            } else {
              homeScreenContainerController.selectIndex.value = value;
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: appTheme.green700,
          unselectedLabelStyle: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.gray800,
            fontSize: 13.fSize,
            fontWeight: FontWeight.w400,
          ),
          selectedLabelStyle: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.green700,
            fontSize: 13.fSize,
            fontWeight: FontWeight.w400,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: homeScreenContainerController.selectIndex.value == 0
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[0].activeIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //color: appTheme.gray800,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[0].icon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //color: theme.colorScheme.primaryContainer,
                      ),
                    ),
              label: bottomMenuList[0].title,
            ),
            BottomNavigationBarItem(
              icon: homeScreenContainerController.selectIndex.value == 1
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[1].activeIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //color: appTheme.gray800,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[1].icon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //color: appTheme.gray800,
                      ),
                    ),
              label: bottomMenuList[1].title,
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: AppDecoration.white,
                child: Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder28,
                  ),
                  child: CustomImageView(
                    imagePath: bottomMenuList[2].activeIcon,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    // color: appTheme.gray800,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: homeScreenContainerController.selectIndex.value == 3
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[3].activeIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //color: appTheme.gray800,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[3].icon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //color: appTheme.gray800,
                      ),
                    ),
              label: bottomMenuList[3].title,
            ),
            BottomNavigationBarItem(
              icon: homeScreenContainerController.selectIndex.value == 4
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[4].activeIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //color: appTheme.gray800,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomImageView(
                        imagePath: bottomMenuList[4].icon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        //  color: appTheme.gray800,
                      ),
                    ),
              label: bottomMenuList[4].title,
            ),
          ],
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Explore,
  Chats,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isCircle = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
