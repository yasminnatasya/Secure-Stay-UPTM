import '../add_property_details_home_filled_screen/widgets/icadd_item_widget.dart';
import 'controller/add_property_details_home_filled_controller.dart';
import 'models/icadd_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_checkbox_button.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class AddPropertyDetailsHomeFilledScreen
    extends GetWidget<AddPropertyDetailsHomeFilledController> {
  const AddPropertyDetailsHomeFilledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildHeader(),
                  SizedBox(height: 25.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h, bottom: 5.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "msg_upload_property2".tr,
                                              style:
                                                  theme.textTheme.titleMedium),
                                          TextSpan(
                                              text: "lbl_max_10_photos".tr,
                                              style: CustomTextStyles
                                                  .titleMediumRedA200_1)
                                        ]),
                                        textAlign: TextAlign.left),
                                    SizedBox(height: 17.v),
                                    _buildIcAdd(),
                                    SizedBox(height: 17.v),
                                    Text("msg_add_property_details".tr,
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(height: 19.v),
                                    _buildMasterUsername(),
                                    SizedBox(height: 17.v),
                                    _buildMasterTextArea(),
                                    SizedBox(height: 16.v),
                                    _buildDetails(),
                                    SizedBox(height: 15.v),
                                    Text("lbl_home_amenties".tr,
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(height: 19.v),
                                    _buildIcCheck(),
                                    SizedBox(height: 17.v),
                                    Text("lbl_monthly_rent".tr,
                                        style: theme.textTheme.bodyLarge),
                                    SizedBox(height: 6.v),
                                    Padding(
                                        padding: EdgeInsets.only(right: 24.h),
                                        child: _buildTwo(
                                            price: "lbl_400".tr,
                                            currency: "lbl_usd".tr)),
                                    SizedBox(height: 17.v),
                                    Text("lbl_deposit".tr,
                                        style: theme.textTheme.bodyLarge),
                                    SizedBox(height: 6.v),
                                    Padding(
                                        padding: EdgeInsets.only(right: 24.h),
                                        child: _buildTwo(
                                            price: "lbl_200".tr,
                                            currency: "lbl_usd".tr)),
                                    SizedBox(height: 15.v),
                                    _buildMasterDropdown(),
                                    SizedBox(height: 15.v),
                                    _buildMasterDropdown1(),
                                    SizedBox(height: 15.v),
                                    _buildMasterDropdown2(),
                                    SizedBox(height: 17.v),
                                    _buildMasterUsername1()
                                  ]))))
                ])),
            bottomNavigationBar: _buildBtnAndBg()));
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
        padding: EdgeInsets.only(top: 18.v, bottom: 17.v),
        decoration: AppDecoration.outlineGray10001,
        child: CustomAppBar(
            leadingWidth: 44.h,
            leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgIcArrowLeft,
                margin: EdgeInsets.only(left: 20.h, top: 2.v, bottom: 5.v)),
            centerTitle: true,
            title: AppbarSubtitle(text: "lbl_add_property".tr),
            actions: [
              AppbarSubtitleTwo(
                  text: "lbl_3_4".tr,
                  margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v))
            ]));
  }

  /// Section Widget
  Widget _buildIcAdd() {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 93.v,
            child: Obx(() => ListView.separated(
                padding: EdgeInsets.only(left: 109.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.h);
                },
                itemCount: controller.addPropertyDetailsHomeFilledModelObj.value
                    .icaddItemList.value.length,
                itemBuilder: (context, index) {
                  IcaddItemModel model = controller
                      .addPropertyDetailsHomeFilledModelObj
                      .value
                      .icaddItemList
                      .value[index];
                  return IcaddItemWidget(model);
                }))));
  }

  /// Section Widget
  Widget _buildFieldlable() {
    return CustomTextFormField(
        controller: controller.fieldlableController,
        hintText: "lbl_sherman_heights".tr);
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_property_title".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 6.v),
          _buildFieldlable()
        ]));
  }

  /// Section Widget
  Widget _buildDescription() {
    return CustomTextFormField(
        controller: controller.descriptionController,
        hintText: "msg_diam_vulputate_ut".tr,
        maxLines: 4);
  }

  /// Section Widget
  Widget _buildMasterTextArea() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_property_description".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 5.v),
          _buildDescription()
        ]));
  }

  /// Section Widget
  Widget _buildSqft() {
    return CustomElevatedButton(
        height: 58.v,
        width: 121.h,
        text: "lbl_2460_sqft".tr,
        margin: EdgeInsets.only(left: 17.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgIcSquarefeetGray900,
                height: 26.adaptSize,
                width: 26.adaptSize)),
        buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL12,
        buttonTextStyle: theme.textTheme.titleSmall!);
  }

  /// Section Widget
  Widget _buildDetails() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Row(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
              decoration: AppDecoration.white
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
              child: Obx(() => CustomCheckboxButton(
                  text: "lbl_02_beds".tr,
                  value: controller.beds.value,
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  textStyle: theme.textTheme.titleSmall,
                  onChange: (value) {
                    controller.beds.value = value;
                  }))),
          Container(
              margin: EdgeInsets.only(left: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
              decoration: AppDecoration.white
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
              child: Obx(() => CustomCheckboxButton(
                  text: "lbl_02_baths".tr,
                  value: controller.baths.value,
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  textStyle: theme.textTheme.titleSmall,
                  onChange: (value) {
                    controller.baths.value = value;
                  }))),
          _buildSqft()
        ]));
  }

  /// Section Widget
  Widget _buildIcCheck() {
    return Container(
        margin: EdgeInsets.only(right: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(children: [
                    SizedBox(
                        width: 65.h,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  margin: EdgeInsets.only(top: 2.v),
                                  decoration: AppDecoration.fillPrimary
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder6),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgIcCheck,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      alignment: Alignment.center)),
                              Text("lbl_wi_fi2".tr,
                                  style: theme.textTheme.bodyLarge)
                            ])),
                    Container(
                        width: 88.h,
                        margin: EdgeInsets.only(left: 59.h),
                        child: Row(children: [
                          Container(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.only(top: 2.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIcCheck,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  alignment: Alignment.center)),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text("lbl_elevator".tr,
                                  style: theme.textTheme.bodyLarge))
                        ])),
                    Container(
                        width: 95.h,
                        margin: EdgeInsets.only(left: 59.h),
                        child: Row(children: [
                          Container(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.only(top: 2.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIcCheck,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  alignment: Alignment.center)),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text("lbl_furniture".tr,
                                  style: theme.textTheme.bodyLarge))
                        ]))
                  ])),
              SizedBox(height: 21.v),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(children: [
                    SizedBox(
                        width: 102.h,
                        child: Row(children: [
                          Container(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.only(top: 2.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIcCheck,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  alignment: Alignment.center)),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text("lbl_generator".tr,
                                  style: theme.textTheme.bodyLarge))
                        ])),
                    Container(
                        width: 126.h,
                        margin: EdgeInsets.only(left: 20.h),
                        child: Row(children: [
                          Container(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.only(top: 2.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIcCheck,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  alignment: Alignment.center)),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text("lbl_air_condition".tr,
                                  style: theme.textTheme.bodyLarge))
                        ]))
                  ])),
              SizedBox(height: 2.v)
            ]));
  }

  /// Section Widget
  Widget _buildInputBox() {
    return CustomTextFormField(
        controller: controller.inputBoxController,
        hintText: "lbl_included".tr,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 17.v, 18.h, 17.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgRightIcon,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 54.v),
        contentPadding: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 16.v));
  }

  /// Section Widget
  Widget _buildMasterDropdown() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_electric_bills".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 7.v),
          _buildInputBox()
        ]));
  }

  /// Section Widget
  Widget _buildInputBox1() {
    return CustomTextFormField(
        controller: controller.inputBoxController1,
        hintText: "lbl_included".tr,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 17.v, 18.h, 17.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgRightIcon,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 54.v),
        contentPadding: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 16.v));
  }

  /// Section Widget
  Widget _buildMasterDropdown1() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_wi_fi_others".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 7.v),
          _buildInputBox1()
        ]));
  }

  /// Section Widget
  Widget _buildMasterDropdown2() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_available".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 7.v),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 14.v),
              decoration: AppDecoration.white
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 3.v),
                    child: Text("lbl_10_11_2023".tr,
                        style: theme.textTheme.bodyLarge)),
                CustomImageView(
                    imagePath: ImageConstant.imgRightIconGray800,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    margin: EdgeInsets.only(left: 260.h, top: 2.v, bottom: 2.v))
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildDuration() {
    return CustomTextFormField(
        controller: controller.durationController,
        hintText: "lbl_6_months".tr,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildMasterUsername1() {
    return Padding(
        padding: EdgeInsets.only(right: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_minimum_stay".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 6.v),
          _buildDuration()
        ]));
  }

  /// Section Widget
  Widget _buildNext() {
    return CustomElevatedButton(
        text: "lbl_next".tr,
        onPressed: () {
          onTapNext();
        });
  }

  /// Section Widget
  Widget _buildBtnAndBg() {
    return Container(
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v),
        decoration: AppDecoration.white,
        child: _buildNext());
  }

  /// Common widget
  Widget _buildTwo({
    required String price,
    required String currency,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Text(price,
                  style: CustomTextStyles.bodyLargeGray800
                      .copyWith(color: appTheme.gray800))),
          Padding(
              padding: EdgeInsets.only(left: 262.h, top: 3.v),
              child: Text(currency,
                  style: CustomTextStyles.bodyLargeGray800
                      .copyWith(color: appTheme.gray800))),
          CustomImageView(
              imagePath: ImageConstant.imgIcArrowDownGray800,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(left: 5.h, top: 2.v, bottom: 2.v))
        ]));
  }

  /// Navigates to the addPropertyDetailsHome1Screen when the action is triggered.
  onTapNext() {
    Get.toNamed(
      AppRoutes.addPropertyDetailsHome1Screen,
    );
  }
}
