import 'controller/identity_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class IdentityScreen extends StatefulWidget {
  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  IdentityController identityController = Get.put(IdentityController());

  String selectProof = "select Identity proof";
  List<String> proof = [
    "AadharCard",
    "LightBill",
    "GasBill",
    "Pan card",
    "passport"
  ];
  String selectCity = "select city";
  List<String> city = ["Broome", "surat", "rajkot"];
  String selectState = "select state";
  List<String> state = ["New york", "Gujarat", "Delhi"];
  String selectCountry = "select country";
  List<String> country = ["USA", "India"];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
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
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                children: [
                  Column(children: [
                    _buildMasterDropdown1(),
                    SizedBox(height: 16.v),
                    _buildMasterUsername1(),
                    SizedBox(height: 16.v),
                    _buildMasterUsername2(),
                    SizedBox(height: 16.v),
                    _buildMasterDropdown2(),
                    SizedBox(height: 16.v),
                    _buildMasterDropdown3(),
                    SizedBox(height: 16.v),
                    _buildMasterDropdown4(),
                    SizedBox(height: 5.v)
                  ]),
                ],
              )),
              _buildContinueButton(),
            ])),
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
                margin: EdgeInsets.only(left: 20.h, top: 3.v, bottom: 4.v)),
            centerTitle: true,
            title: AppbarSubtitle(text: "lbl_identity".tr),
            actions: [
              AppbarSubtitleTwo(
                  text: "lbl_2_5".tr,
                  margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v))
            ]));
  }

  /// Section Widget
  Widget _buildMasterDropdown1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_identity_proof".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      Container(
        height: 54.v,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 11.v),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.h)),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(12.h),
          dropdownColor: Colors.white,
          elevation: 0,
          underline: SizedBox(),
          style: theme.textTheme.bodyLarge,
          icon: CustomImageView(
              imagePath: ImageConstant.imgRightIcon,
              height: 20.adaptSize,
              width: 20.adaptSize),
          hint: Text(
            "$selectProof",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          isExpanded: true,
          items: proof
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectProof = value as String;
            setState(() {});
          },
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildPrice() {
    return CustomTextFormField(
      controller: identityController.priceController,
      hintText: "Enter id number",
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_id_number".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildPrice()
    ]);
  }

  /// Section Widget
  Widget _buildAddress() {
    return CustomTextFormField(
      controller: identityController.addressController,
      hintText: "Enter address detail",
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername2() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_address_line_1".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildAddress()
    ]);
  }

  /// Section Widget
  Widget _buildMasterDropdown2() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_city".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      Container(
        height: 54.v,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 11.v),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.h)),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(12.h),
          dropdownColor: Colors.white,
          elevation: 0,
          underline: SizedBox(),
          style: theme.textTheme.bodyLarge,
          icon: CustomImageView(
              imagePath: ImageConstant.imgRightIcon,
              height: 20.adaptSize,
              width: 20.adaptSize),
          hint: Text(
            "$selectCity",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          isExpanded: true,
          items: city
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectCity = value as String;
            setState(() {});
          },
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildMasterDropdown3() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_state".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      Container(
        height: 54.v,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 11.v),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.h)),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(12.h),
          dropdownColor: Colors.white,
          elevation: 0,
          underline: SizedBox(),
          style: theme.textTheme.bodyLarge,
          icon: CustomImageView(
              imagePath: ImageConstant.imgRightIcon,
              height: 20.adaptSize,
              width: 20.adaptSize),
          hint: Text(
            "$selectState",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          isExpanded: true,
          items: state
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectState = value as String;
            setState(() {});
          },
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildMasterDropdown4() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_country".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      Container(
        height: 54.v,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 11.v),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.h)),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(12.h),
          dropdownColor: Colors.white,
          elevation: 0,
          underline: SizedBox(),
          style: theme.textTheme.bodyLarge,
          icon: CustomImageView(
              imagePath: ImageConstant.imgRightIcon,
              height: 20.adaptSize,
              width: 20.adaptSize),
          hint: Text(
            "$selectCountry",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          isExpanded: true,
          items: country
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectCountry = value as String;
            setState(() {});
          },
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
        text: "lbl_continue".tr,
        onPressed: () {
          onTapContinue();
        });
  }

  /// Section Widget
  Widget _buildContinueButton() {
    return Container(
        height: 112.v,
        padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.v, 40.v),
        decoration: AppDecoration.white,
        child: _buildContinue());
  }

  /// Navigates to the hobbiesScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.hobbiesScreen,
    );
  }
}
