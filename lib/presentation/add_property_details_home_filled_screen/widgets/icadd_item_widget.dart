import '../controller/add_property_details_home_filled_controller.dart';
import '../models/icadd_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class IcaddItemWidget extends StatelessWidget {
  IcaddItemWidget(
    this.icaddItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  IcaddItemModel icaddItemModelObj;

  var controller = Get.find<AddPropertyDetailsHomeFilledController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 93.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 93.adaptSize,
          width: 93.adaptSize,
          padding: EdgeInsets.all(27.h),
          decoration: AppDecoration.white.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Obx(
            () => CustomImageView(
              imagePath: icaddItemModelObj.icAdd!.value,
              height: 38.adaptSize,
              width: 38.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
