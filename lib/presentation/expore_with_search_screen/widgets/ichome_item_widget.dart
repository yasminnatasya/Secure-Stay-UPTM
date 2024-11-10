import '../controller/expore_with_search_controller.dart';
import '../models/ichome_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class IchomeItemWidget extends StatelessWidget {
  IchomeItemWidget(
    this.ichomeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  IchomeItemModel ichomeItemModelObj;

  var controller = Get.find<ExporeWithSearchController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29.v,
      width: 23.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup,
            height: 29.v,
            width: 23.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 18.adaptSize,
              width: 18.adaptSize,
              margin: EdgeInsets.only(top: 3.v),
              padding: EdgeInsets.all(3.h),
              decoration: AppDecoration.white.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder9,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgIcHomeGray900,
                height: 12.adaptSize,
                width: 12.adaptSize,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
