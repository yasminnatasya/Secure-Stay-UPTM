import 'controller/payment_method_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/presentation/payment_success_dialog/payment_success_dialog.dart';
import 'package:uptm_secure_stay/presentation/payment_success_dialog/controller/payment_success_controller.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<PaymentMethodController>(
      init: PaymentMethodController(),
      builder: (controller) => Scaffold(
        backgroundColor: appTheme.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              color: appTheme.gray100,
              width: double.maxFinite,
              child: Column(children: [
                _buildHeader(),
                Expanded(
                  child: ListView(
                    primary: true,
                    shrinkWrap: false,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                    children: [
                      Text("msg_select_payment_method".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 16.v),
                      _buildPaymentDetailsRow1(),
                      SizedBox(height: 16.v),
                      _buildPaymentDetailsRow2(),
                      SizedBox(height: 16.v),
                      _buildPaymentDetailsRow3(),
                      SizedBox(height: 16.v),
                      _buildPaymentDetailsRow4(),
                      SizedBox(height: 16.v),
                      _buildOrderSummary(),
                      SizedBox(height: 5.v),
                    ],
                  ),
                ),
                _buildBtnAndBg()
              ])),
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
            title: AppbarSubtitle(text: "lbl_payment_method".tr)));
  }

  /// Section Widget
  Widget _buildPaymentDetailsRow1() {
    return Obx(
      () => GestureDetector(
        onTap: () {
          paymentMethodController.isPaypal.value =
              !paymentMethodController.isPaypal.value;
          paymentMethodController.isVisa.value = false;
          paymentMethodController.isApplePay.value = false;
          paymentMethodController.isGooglePay.value = false;
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgIcPaypal,
                          height: 34.adaptSize,
                          width: 34.adaptSize),
                      SizedBox(
                        width: 16.h,
                      ),
                      Text(
                        'Paypal',
                        style: TextStyle(
                          color: appTheme.gray900,
                          fontSize: 18,
                          fontFamily: 'Neutrif Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  paymentMethodController.isPaypal.value
                      ? CustomImageView(
                          imagePath: ImageConstant.imgCheckboxPrimarycontainer,
                          height: 20.adaptSize,
                          width: 20.adaptSize)
                      : CustomImageView(
                          imagePath: ImageConstant.imgBlackRadio,
                          height: 20.adaptSize,
                          width: 20.adaptSize),
                ])),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentDetailsRow2() {
    return Obx(
      () => GestureDetector(
        onTap: () {
          paymentMethodController.isVisa.value =
              !paymentMethodController.isVisa.value;
          paymentMethodController.isPaypal.value = false;
          paymentMethodController.isApplePay.value = false;
          paymentMethodController.isGooglePay.value = false;
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                          imagePath:
                              ImageConstant.imgRemixiconsLineLogosVisaline,
                          height: 34.adaptSize,
                          width: 34.adaptSize),
                      SizedBox(
                        width: 16.h,
                      ),
                      Text(
                        "lbl_visa".tr,
                        style: TextStyle(
                          color: appTheme.gray900,
                          fontSize: 18,
                          fontFamily: 'Neutrif Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  paymentMethodController.isVisa.value
                      ? CustomImageView(
                          imagePath: ImageConstant.imgCheckboxPrimarycontainer,
                          height: 20.adaptSize,
                          width: 20.adaptSize)
                      : CustomImageView(
                          imagePath: ImageConstant.imgBlackRadio,
                          height: 20.adaptSize,
                          width: 20.adaptSize),
                ])),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentDetailsRow3() {
    return Obx(
      () => GestureDetector(
        onTap: () {
          paymentMethodController.isApplePay.value =
              !paymentMethodController.isApplePay.value;
          paymentMethodController.isPaypal.value = false;
          paymentMethodController.isVisa.value = false;
          paymentMethodController.isGooglePay.value = false;
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgApple,
                          height: 34.adaptSize,
                          width: 34.adaptSize),
                      SizedBox(
                        width: 16.h,
                      ),
                      Text(
                        "lbl_apple_pay".tr,
                        style: TextStyle(
                          color: appTheme.gray900,
                          fontSize: 18,
                          fontFamily: 'Neutrif Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  paymentMethodController.isApplePay.value
                      ? CustomImageView(
                          imagePath: ImageConstant.imgCheckboxPrimarycontainer,
                          height: 20.adaptSize,
                          width: 20.adaptSize)
                      : CustomImageView(
                          imagePath: ImageConstant.imgBlackRadio,
                          height: 20.adaptSize,
                          width: 20.adaptSize),
                ])),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentDetailsRow4() {
    return Obx(
      () => GestureDetector(
        onTap: () {
          paymentMethodController.isGooglePay.value =
              !paymentMethodController.isGooglePay.value;
          paymentMethodController.isPaypal.value = false;
          paymentMethodController.isVisa.value = false;
          paymentMethodController.isApplePay.value = false;
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgIcGoogleRed500,
                          height: 34.adaptSize,
                          width: 34.adaptSize),
                      SizedBox(
                        width: 16.h,
                      ),
                      Text(
                        "lbl_google_pay".tr,
                        style: TextStyle(
                          color: appTheme.gray900,
                          fontSize: 18,
                          fontFamily: 'Neutrif Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  paymentMethodController.isGooglePay.value
                      ? CustomImageView(
                          imagePath: ImageConstant.imgCheckboxPrimarycontainer,
                          height: 20.adaptSize,
                          width: 20.adaptSize)
                      : CustomImageView(
                          imagePath: ImageConstant.imgBlackRadio,
                          height: 20.adaptSize,
                          width: 20.adaptSize),
                ])),
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderSummary() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("lbl_order_summary".tr,
                  style: theme.textTheme.titleMedium)),
          SizedBox(height: 16.v),
          _buildTax(
              serviceChargeText: "lbl_monthly_fee".tr,
              priceText: "lbl_1650_00".tr),
          SizedBox(height: 16.v),
          _buildTax(
              serviceChargeText: "lbl_service_charge".tr,
              priceText: "lbl_300_00".tr),
          SizedBox(height: 16.v),
          _buildTax(
              serviceChargeText: "lbl_tax".tr, priceText: "lbl_160_00".tr),
          SizedBox(height: 16.v),
          Divider(
            color: appTheme.black20,
          ),
          SizedBox(height: 16.v),
          _buildTax(
              serviceChargeText: "msg_total_payment_amount".tr,
              priceText: "lbl_35_00".tr)
        ]));
  }

  /// Section Widget
  Widget _buildBtnAndBg() {
    return Container(
        // height: 112.h,
        padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
        decoration: AppDecoration.white,
        child: CustomElevatedButton(
            text: "lbl_pay_now".tr,
            onPressed: () {
              onTapPayNow();
            }));
  }

  /// Common widget
  Widget _buildTax({
    required String serviceChargeText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(serviceChargeText,
          style: CustomTextStyles.bodyLargeGray800
              .copyWith(color: appTheme.gray800)),
      Text(priceText,
          style: CustomTextStyles.titleMediumBold16
              .copyWith(color: appTheme.gray900))
    ]);
  }

  /// Displays a dialog with the [PaymentSuccessDialog] content.
  onTapPayNow() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
              content: PaymentSuccessDialog(
                Get.put(
                  PaymentSuccessController(),
                ),
              ),
            ));
  }
}
