import '../controller/property_details_two_controller.dart';
import '../models/bedroomslist1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class Bedroomslist1ItemWidget extends StatelessWidget {
  Bedroomslist1ItemWidget(
    this.bedroomslist1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Bedroomslist1ItemModel bedroomslist1ItemModelObj;

  var controller = Get.find<PropertyDetailsTwoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      width: 133.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: bedroomslist1ItemModelObj.bedrooms!.value,
              height: 26.adaptSize,
              width: 26.adaptSize,
            ),
          ),
          SizedBox(height: 17.v),
          Obx(
            () => Text(
              bedroomslist1ItemModelObj.bedroomsCounter!.value,
              style: CustomTextStyles.titleMediumBold16,
            ),
          ),
          SizedBox(height: 3.v),
        ],
      ),
    );
  }
}
