// ignore_for_file: unnecessary_null_comparison

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

import 'controller/booking_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  BookingDetailsController controller = Get.put(BookingDetailsController());
  List<DateTime?> _dates = [];
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder(
      init: BookingDetailsController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.white,
        body: SafeArea(
          child: Container(
            color: appTheme.gray100,
            width: double.maxFinite,
            child: Column(children: [
              _buildHeader(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 24.v),
                  primary: true,
                  shrinkWrap: false,
                  children: [
                    Text("msg_select_date_and".tr,
                        style: theme.textTheme.titleMedium),
                    SizedBox(height: 16.v),
                    _buildComponentOne(),
                    SizedBox(height: 16.v),
                    Text("lbl_resident".tr, style: theme.textTheme.titleMedium),
                    SizedBox(height: 16.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 16.v,
                      ),
                      decoration: AppDecoration.white.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Adults",
                                  style: CustomTextStyles.titleMediumBold16,
                                ),
                                SizedBox(height: 8.v),
                                Text(
                                  "After 12 years",
                                  style: CustomTextStyles.bodyMediumGray800,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.adultDecrement();
                                },
                                child: CustomIconButton(
                                  height: 28.adaptSize,
                                  width: 28.adaptSize,
                                  padding: EdgeInsets.all(5.h),
                                  decoration:
                                      IconButtonStyleHelper.fillGrayTL14,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgIcMinus,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.h),
                                child: Obx(
                                  () => Text(
                                    "${controller.adultCount}",
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.adultIncrement();
                                },
                                child: CustomIconButton(
                                  height: 28.adaptSize,
                                  width: 28.adaptSize,
                                  padding: EdgeInsets.all(5.h),
                                  decoration:
                                      IconButtonStyleHelper.fillGrayTL14,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgIcAdd,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.v,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 16.v,
                      ),
                      decoration: AppDecoration.white.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Children",
                                  style: CustomTextStyles.titleMediumBold16,
                                ),
                                SizedBox(height: 8.v),
                                Text(
                                  "0-12 years",
                                  style: CustomTextStyles.bodyMediumGray800,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.childrenDecrement();
                                },
                                child: CustomIconButton(
                                  height: 28.adaptSize,
                                  width: 28.adaptSize,
                                  padding: EdgeInsets.all(5.h),
                                  decoration:
                                      IconButtonStyleHelper.fillGrayTL14,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgIcMinus,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.h),
                                child: Obx(
                                  () => Text(
                                    "${controller.childrenCount}",
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.childrenIncrement();
                                },
                                child: CustomIconButton(
                                  height: 28.adaptSize,
                                  width: 28.adaptSize,
                                  padding: EdgeInsets.all(5.h),
                                  decoration:
                                      IconButtonStyleHelper.fillGrayTL14,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgIcAdd,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildBtnAndBg(),
            ]),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
        padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
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
            title: AppbarSubtitle(text: "msg_schedule_booking".tr)));
  }

  /// Section Widget
  Widget _buildComponentOne() {
    return Container(
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 11.v),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  weekdayLabelTextStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: appTheme.gray600,
                    fontWeight: FontWeight.w700,
                  ),
                  weekdayLabels: ["S", "M", "T", "W", "T", "F", "S"],
                  controlsTextStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: appTheme.gray900,
                    fontWeight: FontWeight.w600,
                  ),
                  customModePickerIcon: CustomImageView(
                    imagePath: ImageConstant.rightArrowYellow,
                    width: 7.h,
                    height: 11.h,
                    margin: EdgeInsets.only(left: 8.h, bottom: 4.v, right: 8.h),
                  ),
                  lastMonthIcon: CustomImageView(
                    imagePath: ImageConstant.leftArrowYellow,
                    width: 10.h,
                    height: 17.h,
                  ),
                  nextMonthIcon: CustomImageView(
                    imagePath: ImageConstant.rightArrowYellow,
                    width: 10.h,
                    height: 17.h,
                  ),
                  dayTextStyle: theme.textTheme.titleMedium,
                  selectedDayHighlightColor: appTheme.buttonColor,
                  selectedDayTextStyle: theme.textTheme.titleMedium!
                      .copyWith(color: appTheme.white),
                ),
                value: _dates,
                onValueChanged: (dates) => _dates = dates,
              ),
              SizedBox(height: 11.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time',
                    style:
                        theme.textTheme.titleMedium!.copyWith(fontSize: 17.h),
                  ),
                  GestureDetector(
                    onTap: () async {
                      controller.pickedTime = await showTimePicker(
                          context: context, initialTime: controller.selectTime);

                      controller.selectTime = controller.pickedTime!;
                      controller.update();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.h)),
                          color: appTheme.gray100),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
                      child: Text(
                        (controller.selectTime != null)
                            ? '${controller.selectTime.format(context)}'
                            : '9:41 AM',
                        style:
                            theme.textTheme.bodyLarge!.copyWith(fontSize: 17.h),
                      ),
                    ),
                  )
                ],
              )
            ]));
  }

  /// Section Widget
  Widget _buildBtnAndBg() {
    return Container(
        height: 112.h,
        padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
        decoration: AppDecoration.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 10.v, bottom: 13.v),
                  child: Text("lbl_500_00".tr,
                      style: theme.textTheme.headlineSmall)),
              CustomElevatedButton(
                  width: 190.h,
                  text: "lbl_continue".tr,
                  onPressed: () {
                    onTapContinue();
                  })
            ]));
  }

  /// Navigates to the paymentMethodScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.paymentMethodScreen,
    );
  }
}
