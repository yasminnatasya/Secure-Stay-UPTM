import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/favorite_controller.dart';
import '../models/favorite_item_model.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_checkbox_button.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

class FavoriteItemWidget extends StatelessWidget {
  final FavoriteItemModel favoriteItemModelObj;

  FavoriteItemWidget(
    this.favoriteItemModelObj, {
    Key? key,
  }) : super(key: key);

  final controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 116.v,
            width: 174.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: favoriteItemModelObj.grandtown!.value,
                    height: 116.v,
                    width: 174.h,
                    radius: BorderRadius.circular(12.h),
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    right: 8.h,
                  ),
                  child: CustomIconButton(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    padding: EdgeInsets.all(4.h),
                    alignment: Alignment.topRight,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgLikeGray900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Obx(
            () => Text(
              favoriteItemModelObj.shermanOaks!.value,
              style: CustomTextStyles.titleMediumBold16,
            ),
          ),
          SizedBox(height: 10.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIcLocationGray800,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.only(bottom: 1.v),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Obx(
                  () => Text(
                    favoriteItemModelObj.washington!.value,
                    style: CustomTextStyles.bodySmallGray800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 9.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "lbl_200".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "lbl_mo".tr,
                      style: CustomTextStyles.bodySmallGray80012,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(left: 45.h, top: 5.v),
                child: Obx(
                  () => CustomCheckboxButton(
                    text: "lbl_03".tr,
                    value: favoriteItemModelObj.three!.value,
                    onChange: (value) {
                      favoriteItemModelObj.three!.value = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h, top: 5.v, bottom: 2.v),
                child: Obx(
                  () => CustomCheckboxButton(
                    text: "lbl_03".tr,
                    value: favoriteItemModelObj.three1!.value,
                    onChange: (value) {
                      favoriteItemModelObj.three1!.value = value;
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.v),
        ],
      ),
    );
  }
}
