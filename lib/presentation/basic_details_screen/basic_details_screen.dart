import 'controller/basic_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class BasicDetailsScreen extends StatefulWidget {
  const BasicDetailsScreen({super.key});

  @override
  State<BasicDetailsScreen> createState() => _BasicDetailsScreenState();
}

class _BasicDetailsScreenState extends State<BasicDetailsScreen> {
  BasicDetailsController basicDetailsController =
      Get.put(BasicDetailsController());
  String selectGender = "select gender";
  List<String> gender = ["Male", "Female"];
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
                padding: EdgeInsets.symmetric(vertical: 24.v, horizontal: 16.h),
                children: [
                  Column(children: [
                    _buildMasterUsername(),
                    SizedBox(height: 16.v),
                    _buildMasterUsernameDateOfBirth(),
                    SizedBox(height: 16.v),
                    _buildMasterDropdown(),
                    SizedBox(height: 16.v),
                    _buildMasterUsername1(),
                    SizedBox(height: 5.v)
                  ]),
                ],
              )),
              _buildContinue1(),
            ])),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
        padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
        decoration: AppDecoration.outlineGray10001,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 5.v),
          CustomAppBar(
              leadingWidth: 44.h,
              leading: AppbarLeadingImage(
                  onTap: () {
                    Get.back();
                  },
                  imagePath: ImageConstant.imgIcArrowLeft,
                  margin: EdgeInsets.only(left: 20.h, top: 5.v, bottom: 2.v)),
              centerTitle: true,
              title: AppbarSubtitle(text: "msg_basic_information".tr),
              actions: [
                AppbarSubtitleTwo(
                    text: "1/5",
                    margin: EdgeInsets.fromLTRB(16.h, 4.v, 16.h, 3.v))
              ])
        ]));
  }

  /// Section Widget
  Widget _buildMasterUsernameFullName() {
    return CustomTextFormField(
      controller: basicDetailsController.masterUsernameFullNameController,
      hintText: "Enter your full name",
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_full_name".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 8.v),
      _buildMasterUsernameFullName()
    ]);
  }

  /// Section Widget
  Widget _buildMasterUsernameDateOfBirth() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_date_of_birth".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      CustomTextFormField(
        controller: basicDetailsController.dateTime,
        hintText: 'YYYY/MM/DD',
        enableBorder: false,
        suffix: GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2050));
            if (pickedDate != null) {
              basicDetailsController.dateTime.text =
                  '${pickedDate.year} - ${pickedDate.month} - ${pickedDate.day}';
            } else {
              print("Date is not selected");
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.v, horizontal: 16.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgIcCalender,
                height: 24.adaptSize,
                width: 24.adaptSize),
          ),
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildMasterDropdown() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_gender".tr, style: theme.textTheme.bodyLarge),
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
            "$selectGender",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          isExpanded: true,
          items: gender
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectGender = value as String;
            setState(() {});
          },
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildMasterUsernameOccupation() {
    return CustomTextFormField(
        controller: basicDetailsController.masterUsernameOccupationController,
        hintText: "Enter your occupation",
        enableBorder: false,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildMasterUsername1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_occupation".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildMasterUsernameOccupation()
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
  Widget _buildContinue1() {
    return Container(
        height: 112.v,
        padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.v, 40.v),
        decoration: AppDecoration.white,
        child: _buildContinue());
  }

  /// Navigates to the identityScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.identityScreen,
    );
  }
}
