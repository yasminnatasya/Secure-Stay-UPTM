import '../controller/onboarding_controller.dart';
import '../models/onboardingslider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class OnboardingsliderItemWidget extends StatelessWidget {
  OnboardingsliderItemWidget(
    this.onboardingsliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OnboardingsliderItemModel onboardingsliderItemModelObj;

  var controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 373.h,
          child: Text(
            "msg_looking_for_a_place".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.headlineMediumOnPrimaryContainer.copyWith(
              height: 1.36,
            ),
          ),
        ),
        SizedBox(height: 14.v),
        Container(
          width: 366.h,
          margin: EdgeInsets.only(
            left: 4.h,
            right: 2.h,
          ),
          child: Text(
            "msg_investment_opportunity".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyLargeOnPrimaryContainer.copyWith(
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }
}
