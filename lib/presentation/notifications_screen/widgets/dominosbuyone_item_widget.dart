import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class DominosbuyoneItemWidget extends StatelessWidget {
  String dominoSBuyOne;
  String buyGetFree;
  String duration;
  DominosbuyoneItemWidget(
      {Key? key,
      required this.dominoSBuyOne,
      required this.buyGetFree,
      required this.duration})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 80.v),
            child: CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(6.h),
              decoration: IconButtonStyleHelper.outlineBlackTL20,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup4,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 14.h,
                top: 5.v,
                bottom: 3.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dominoSBuyOne,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.v),
                  SizedBox(
                    width: 258.h,
                    child: Text(
                      buyGetFree,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeGray800.copyWith(
                        height: 1.50.v,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    duration,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
