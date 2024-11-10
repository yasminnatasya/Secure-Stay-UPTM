import 'package:uptm_secure_stay/presentation/edit_and_delete_address_bottomsheet/edit_and_delete_address_bottomsheet.dart';

import '../my_address_screen/widgets/defaultlist_item_widget.dart';
import 'controller/my_address_controller.dart';
import 'models/defaultlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_trailing_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/presentation/edit_and_delete_address_bottomsheet/controller/edit_and_delete_address_controller.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  MyAddressController myAddressController = Get.put(MyAddressController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder(
      init: MyAddressController(),
      builder: (controller) => Scaffold(
          backgroundColor: appTheme.white,
          body: SafeArea(
            child: Container(
                color: appTheme.gray100,
                width: double.maxFinite,
                child: Column(children: [_buildHeader(), _buildDefaultList()])),
          )),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
        padding: EdgeInsets.only(top: 18.v, bottom: 17.v),
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
            title: AppbarSubtitle(text: "lbl_my_address".tr),
            actions: [
              AppbarTrailingImage(
                  imagePath: ImageConstant.add,
                  margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v),
                  onTap: () {
                    onTapIcAdd();
                  })
            ]));
  }

  /// Section Widget
  Widget _buildDefaultList() {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: defaultListItemList.length,
        itemBuilder: (context, index) {
          return DefaultListItemWidget(
            home: defaultListItemList[index].home,
            parkerRd: defaultListItemList[index].parkerRd,
            widget: defaultListItemList[index].widget,
            index: index,
            onTapDefault: () {
              onTapDefault();
            },
          );
        });
  }

  /// Displays a scrollable bottom sheet widget using the [Get] package
  /// and the [EditAndDeleteAddressBottomsheet] widget.
  ///
  /// The bottom sheet is controlled by the [EditAndDeleteAddressController]
  /// and is displayed using the [Get.bottomSheet] method with
  /// [isScrollControlled] set to true.
  onTapDefault() {
    Get.bottomSheet(
        EditAndDeleteAddressBottomSheet(
            Get.put(EditAndDeleteAddressController())),
        isScrollControlled: true);
  }

  /// Navigates to the addNewAddressScreen when the action is triggered.
  onTapIcAdd() {
    Get.toNamed(
      AppRoutes.addNewAddressScreen,
    );
  }
}
