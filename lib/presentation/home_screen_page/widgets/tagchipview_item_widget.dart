import '../models/tagchipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class TagchipviewItemWidget extends StatelessWidget {
  TagchipviewItemWidget(
    this.tagchipviewItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TagchipviewItemModel tagchipviewItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.only(
          top: 9.v,
          right: 12.h,
          bottom: 9.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          tagchipviewItemModelObj.tag!.value,
          style: TextStyle(
            color: appTheme.gray800,
            fontSize: 16.fSize,
            fontFamily: 'Neutrif Pro',
            fontWeight: FontWeight.w400,
          ),
        ),
        avatar: CustomImageView(
          imagePath: ImageConstant.imgIcHome,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(right: 10.h),
        ),
        selected: (tagchipviewItemModelObj.isSelected?.value ?? false),
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        selectedColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        shape: (tagchipviewItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(0.6),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  6.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.gray300,
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  6.h,
                ),
              ),
        onSelected: (value) {
          tagchipviewItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
