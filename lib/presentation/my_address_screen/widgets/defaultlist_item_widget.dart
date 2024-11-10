import '../controller/my_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class DefaultListItemWidget extends StatelessWidget {
  String home;
  String parkerRd;
  String widget;
  VoidCallback? onTapDefault;
  int? index;

  DefaultListItemWidget({
    Key? key,
    required this.home,
    required this.parkerRd,
    required this.widget,
    this.onTapDefault,
    this.index,
  }) : super(
          key: key,
        );

  var controller = Get.find<MyAddressController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(
            height: 33.v,
            width: 34.h,
            padding: EdgeInsets.all(7.h),
            decoration: IconButtonStyleHelper.fillBlueGray,
            child: CustomImageView(
              imagePath: ImageConstant.imgLocationPrimarycontainer,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                bottom: 3.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    home,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    parkerRd,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 1.50,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    widget,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Visibility(
                visible: (index == 0),
                child: Text(
                  "lbl_default".tr,
                  style: TextStyle(
                    color: appTheme.green700,
                    fontSize: 14.fSize,
                    fontFamily: 'Neutrif Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  onTapDefault!();
                },
                child: CustomImageView(
                  imagePath: ImageConstant.imgIcMore,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
