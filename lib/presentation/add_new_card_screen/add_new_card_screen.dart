import 'controller/add_new_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/core/utils/validation_functions.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  AddNewCardController addNewCardController = Get.put(AddNewCardController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: appTheme.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Container(
                  color: appTheme.gray100,
                  width: double.maxFinite,
                  child: Column(children: [
                    _buildHeader(),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 10.v),
                        child: Column(children: [
                          SizedBox(
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_enter_your_card2".tr,
                                        style: theme.textTheme.bodyLarge),
                                    TextSpan(
                                        text: "lbl_learn_more".tr,
                                        style: CustomTextStyles
                                            .bodyLargePrimaryContainer)
                                  ]),
                                  textAlign: TextAlign.center)),
                          SizedBox(height: 24.v),
                          _buildMasterUsername(),
                          SizedBox(height: 16.v),
                          _buildExpirydate(),
                          SizedBox(height: 30.v),
                          _buildAddNewCardButton(),
                          SizedBox(height: 5.v)
                        ]))
                  ]))),
        ));
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
        padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
        decoration: AppDecoration.outlineGray10001,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              CustomAppBar(
                  leadingWidth: 44.h,
                  leading: AppbarLeadingImage(
                      onTap: () {
                        Get.back();
                      },
                      imagePath: ImageConstant.imgIcArrowLeft,
                      margin:
                          EdgeInsets.only(left: 20.h, top: 5.v, bottom: 2.v)),
                  centerTitle: true,
                  title: AppbarSubtitle(text: "lbl_add_new_card".tr))
            ]));
  }

  /// Section Widget
  Widget _buildCardNumberEditText() {
    return CustomTextFormField(
        controller: addNewCardController.cardNumberEditTextController,
        hintText: "msg_enter_your_card3".tr,
        enableBorder: false,
        textInputType: TextInputType.number,
        validator: (value) {
          if (!isNumeric(value)) {
            return "err_msg_please_enter_valid_number".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_card_number".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildCardNumberEditText()
    ]);
  }

  /// Section Widget
  Widget _buildExpiryDateEditText() {
    return Container(
      child: CustomTextFormField(
          controller: addNewCardController.expiryDateEditTextController,
          hintText: "lbl_mm_yy".tr,
          enableBorder: false,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 7.h, vertical: 16.v)),
    );
  }

  /// Section Widget
  Widget _buildCvvEditText() {
    return Container(
      child: CustomTextFormField(
          controller: addNewCardController.cvvEditTextController,
          hintText: "lbl_123".tr,
          enableBorder: false,
          textInputAction: TextInputAction.done,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 7.h, vertical: 16.v)),
    );
  }

  /// Section Widget
  Widget _buildExpirydate() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(top: 1.v, right: 8.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_expiry_date".tr,
                        style: theme.textTheme.bodyLarge),
                    SizedBox(height: 5.v),
                    _buildExpiryDateEditText()
                  ]))),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_cvv".tr, style: theme.textTheme.bodyLarge),
                    SizedBox(height: 5.v),
                    _buildCvvEditText()
                  ])))
    ]);
  }

  /// Section Widget
  Widget _buildAddNewCardButton() {
    return CustomElevatedButton(
        text: "lbl_add_new_card".tr,
        onPressed: () {
          onTapAddNewCardButton();
        });
  }

  /// Navigates to the myCardsScreen when the action is triggered.
  onTapAddNewCardButton() {
    Get.back();
  }
}
