import 'dart:io';

import 'controller/add_property_details_for_roommate_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class AddPropertyDetailsForRoommateScreen extends StatefulWidget {
  const AddPropertyDetailsForRoommateScreen({super.key});

  @override
  State<AddPropertyDetailsForRoommateScreen> createState() =>
      _AddPropertyDetailsForRoommateScreenState();
}

class _AddPropertyDetailsForRoommateScreenState
    extends State<AddPropertyDetailsForRoommateScreen> {
  AddPropertyDetailsForRoommateController
      addPropertyDetailsForRoommateController =
      Get.put(AddPropertyDetailsForRoommateController());

  String selectCurrency = "USD";
  List<String> currency = [
    "USD",
    "INR",
    "EUR",
    "GBP",
    "AUD",
  ];
  String selectDeposit = "USD";
  List<String> deposit = [
    "USD",
    "INR",
    "EUR",
    "GBP",
    "AUD",
  ];

  String selectElectricBills = "Select";
  List<String> electricBills = [
    "Dakshin gujrat vij company ltd",
  ];
  String selectWifi = "Select";
  List<String> wifiOther = [
    "Garden",
    "Network",
    "gym",
    "pool",
    "parking",
    "security"
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _buildBtnAndBg(),
      body: SafeArea(
        child: Container(
            color: appTheme.gray100,
            width: double.maxFinite,
            child: Column(children: [
              _buildHeader(),
              Expanded(
                child: Obx(() {
                  // Conditionally render the form stage based on the currentFormStage
                  return ListView(
                    primary: true,
                    shrinkWrap: false,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                    children: addPropertyDetailsForRoommateController
                                .currentFormStage.value ==
                            1
                        ? _buildFirstStageForm()
                        : _buildSecondStageForm(),
                  );
                }),
              ),
            ])),
      ),
    );
  }

  List<Widget> _buildFirstStageForm() {
    return [
      _buildCover(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("msg_add_property_details".tr,
              style: theme.textTheme.titleMedium)),
      SizedBox(height: 16.v),
      _buildMasterUsername(),
      SizedBox(height: 16.v),
      _buildAddressField(), // Add the address field here
      SizedBox(height: 16.v),
      _buildMasterTextArea(),
      SizedBox(height: 16.v),
      _buildDetails(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("lbl_monthly_rent".tr, style: theme.textTheme.bodyLarge)),
      SizedBox(height: 5.v),
      _buildMonthlyRent(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("lbl_deposit".tr, style: theme.textTheme.bodyLarge)),
      SizedBox(height: 5.v),
      _buildDeposit(),
    ];
  }

  List<Widget> _buildSecondStageForm() {
    return [
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text("lbl_home_amenties".tr, style: theme.textTheme.titleMedium)),
      SizedBox(height: 16.v),
      _buildWifi(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text("lbl_suitable_for".tr, style: theme.textTheme.titleMedium)),
      SizedBox(height: 16.v),
      _buildStudents(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text("lbl_electric_bills".tr, style: theme.textTheme.bodyLarge)),
      SizedBox(height: 5.v),
      _buildElectricBills(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("lbl_wi_fi_others".tr, style: theme.textTheme.bodyLarge)),
      SizedBox(height: 5.v),
      _buildWifiOthers(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("lbl_available".tr, style: theme.textTheme.bodyLarge)),
      SizedBox(height: 5.v),
      _buildAvailable(),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.centerLeft,
          child: Text("lbl_minimum_stay".tr, style: theme.textTheme.bodyLarge)),
      SizedBox(height: 5.v),
      _buildMinimumStay(),
    ];
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
            title: AppbarSubtitle(text: "lbl_add_property".tr),
            actions: [
              AppbarSubtitleTwo(
                  text: "1/3",
                  margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v))
            ]));
  }

  /// Section Widget for the image picker
  Widget _buildCover() {
    return GestureDetector(
      onTap: () async {
        // Trigger image picking
        await addPropertyDetailsForRoommateController.pickImage();
        setState(() {}); // Update the UI after picking an image
      },
      child: Obx(() {
        // Check if an image has been selected
        String? imagePath =
            addPropertyDetailsForRoommateController.selectedImagePath.value;
        return Container(
          height: 196.v,
          decoration: AppDecoration.white
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
          child: imagePath == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgIcGallery,
                        height: 40.adaptSize,
                        width: 40.adaptSize),
                    SizedBox(height: 12.v),
                    Text("lbl_add_cover_image".tr,
                        style: CustomTextStyles.titleMediumSFProDisplayGray800)
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12.v),
                  child: Image.file(
                    File(imagePath),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
        );
      }),
    );
  }

  /// Section Widget
  Widget _buildFieldlable() {
    return CustomTextFormField(
      controller: addPropertyDetailsForRoommateController.fieldLableController,
      hintText: "lbl_title".tr,
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_title".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 8.v),
      _buildFieldlable()
    ]);
  }

  /// Section Widget
  Widget _buildPlaceholder() {
    return CustomTextFormField(
        controller:
            addPropertyDetailsForRoommateController.placeholderController,
        hintText: "lbl_description".tr,
        enableBorder: false,
        maxLines: 6);
  }

  /// Section Widget
  Widget _buildMasterTextArea() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_property_description".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildPlaceholder()
    ]);
  }

  Widget _buildAddressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Enter address".tr, style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.v),
        CustomTextFormField(
          controller: addPropertyDetailsForRoommateController.addressController,
          hintText: "Enter address",
          enableBorder: false,
          maxLines: 2, // Allow for multi-line input if needed
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBeds() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: CustomTextFormField(
                controller:
                    addPropertyDetailsForRoommateController.bedController,
                hintText: "lbl_beds".tr,
                enableBorder: false,
                hintStyle: theme.textTheme.titleSmall!,
                prefix: Container(
                    margin: EdgeInsets.fromLTRB(12.h, 16.v, 8.h, 16.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.bed,
                        height: 26.adaptSize,
                        width: 26.adaptSize)),
                prefixConstraints: BoxConstraints(maxHeight: 58.v),
                contentPadding:
                    EdgeInsets.only(top: 19.v, right: 30.h, bottom: 19.v))));
  }

  Widget _buildBaths() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: CustomTextFormField(
                controller:
                    addPropertyDetailsForRoommateController.bathsController,
                hintText: "lbl_baths".tr,
                enableBorder: false,
                hintStyle: theme.textTheme.titleSmall!,
                prefix: Container(
                    margin: EdgeInsets.fromLTRB(12.h, 16.v, 8.h, 16.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.bathtub,
                        height: 26.adaptSize,
                        width: 26.adaptSize)),
                prefixConstraints: BoxConstraints(maxHeight: 58.v),
                contentPadding:
                    EdgeInsets.only(top: 19.v, right: 30.h, bottom: 19.v))));
  }

  Widget _buildSQFT() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: CustomTextFormField(
                controller:
                    addPropertyDetailsForRoommateController.sQFTController,
                hintText: "lbl_sqft".tr,
                enableBorder: false,
                hintStyle: theme.textTheme.titleSmall!,
                prefix: Container(
                    margin: EdgeInsets.fromLTRB(12.h, 16.v, 8.h, 16.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgIcSquarefeetGray900,
                        height: 26.adaptSize,
                        width: 26.adaptSize)),
                prefixConstraints: BoxConstraints(maxHeight: 58.v),
                contentPadding:
                    EdgeInsets.only(top: 19.v, right: 30.h, bottom: 19.v))));
  }

  /// Section Widget
  Widget _buildDetails() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildBeds(), _buildBaths(), _buildSQFT()]);
  }

  /// Section Widget
  Widget _buildWifi() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addPropertyDetailsForRoommateController.wifi.value =
                                !addPropertyDetailsForRoommateController
                                    .wifi.value;
                          },
                          child: addPropertyDetailsForRoommateController
                                      .wifi.value ==
                                  true
                              ? CustomImageView(
                                  imagePath:
                                      "assets/images/check box theme.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )
                              : CustomImageView(
                                  imagePath: "assets/images/check box.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_wi_fi2".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addPropertyDetailsForRoommateController
                                    .elevator.value =
                                !addPropertyDetailsForRoommateController
                                    .elevator.value;
                          },
                          child: addPropertyDetailsForRoommateController
                                      .elevator.value ==
                                  true
                              ? CustomImageView(
                                  imagePath:
                                      "assets/images/check box theme.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )
                              : CustomImageView(
                                  imagePath: "assets/images/check box.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_elevator".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addPropertyDetailsForRoommateController
                                    .furniture.value =
                                !addPropertyDetailsForRoommateController
                                    .furniture.value;
                          },
                          child: addPropertyDetailsForRoommateController
                                      .furniture.value ==
                                  true
                              ? CustomImageView(
                                  imagePath:
                                      "assets/images/check box theme.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )
                              : CustomImageView(
                                  imagePath: "assets/images/check box.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_furniture".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
              ]),
              SizedBox(height: 21.v),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => GestureDetector(
                            onTap: () {
                              addPropertyDetailsForRoommateController
                                      .generator.value =
                                  !addPropertyDetailsForRoommateController
                                      .generator.value;
                            },
                            child: addPropertyDetailsForRoommateController
                                        .generator.value ==
                                    true
                                ? CustomImageView(
                                    imagePath:
                                        "assets/images/check box theme.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )
                                : CustomImageView(
                                    imagePath: "assets/images/check box.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("lbl_generator".tr,
                              style: theme.textTheme.bodyLarge)),
                    ],
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => GestureDetector(
                            onTap: () {
                              addPropertyDetailsForRoommateController
                                      .airCondition.value =
                                  !addPropertyDetailsForRoommateController
                                      .airCondition.value;
                            },
                            child: addPropertyDetailsForRoommateController
                                        .airCondition.value ==
                                    true
                                ? CustomImageView(
                                    imagePath:
                                        "assets/images/check box theme.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )
                                : CustomImageView(
                                    imagePath: "assets/images/check box.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("lbl_air_condition".tr,
                              style: theme.textTheme.bodyLarge)),
                    ],
                  ),
                ],
              ),
            ]));
  }

  /// Section Widget
  Widget _buildStudents() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addPropertyDetailsForRoommateController
                                    .students.value =
                                !addPropertyDetailsForRoommateController
                                    .students.value;
                          },
                          child: addPropertyDetailsForRoommateController
                                      .students.value ==
                                  true
                              ? CustomImageView(
                                  imagePath:
                                      "assets/images/check box theme.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )
                              : CustomImageView(
                                  imagePath: "assets/images/check box.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_students".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addPropertyDetailsForRoommateController.male.value =
                                !addPropertyDetailsForRoommateController
                                    .male.value;
                          },
                          child: addPropertyDetailsForRoommateController
                                      .male.value ==
                                  true
                              ? CustomImageView(
                                  imagePath:
                                      "assets/images/check box theme.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )
                              : CustomImageView(
                                  imagePath: "assets/images/check box.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_male".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addPropertyDetailsForRoommateController
                                    .petLover.value =
                                !addPropertyDetailsForRoommateController
                                    .petLover.value;
                          },
                          child: addPropertyDetailsForRoommateController
                                      .petLover.value ==
                                  true
                              ? CustomImageView(
                                  imagePath:
                                      "assets/images/check box theme.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )
                              : CustomImageView(
                                  imagePath: "assets/images/check box.svg",
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_pet_lover".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
              ]),
              SizedBox(height: 21.v),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => GestureDetector(
                            onTap: () {
                              addPropertyDetailsForRoommateController
                                      .vegetarian.value =
                                  !addPropertyDetailsForRoommateController
                                      .vegetarian.value;
                            },
                            child: addPropertyDetailsForRoommateController
                                        .vegetarian.value ==
                                    true
                                ? CustomImageView(
                                    imagePath:
                                        "assets/images/check box theme.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )
                                : CustomImageView(
                                    imagePath: "assets/images/check box.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("lbl_vegetarian".tr,
                              style: theme.textTheme.bodyLarge)),
                    ],
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => GestureDetector(
                            onTap: () {
                              addPropertyDetailsForRoommateController
                                      .nonsmoker.value =
                                  !addPropertyDetailsForRoommateController
                                      .nonsmoker.value;
                            },
                            child: addPropertyDetailsForRoommateController
                                        .nonsmoker.value ==
                                    true
                                ? CustomImageView(
                                    imagePath:
                                        "assets/images/check box theme.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )
                                : CustomImageView(
                                    imagePath: "assets/images/check box.svg",
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("lbl_non_smoker".tr,
                              style: theme.textTheme.bodyLarge)),
                    ],
                  ),
                ],
              ),
            ]));
  }

  /// Section Widget
  Widget _buildInputBox() {
    return Container(
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
          "$selectElectricBills",
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        isExpanded: true,
        items: electricBills
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          selectElectricBills = value as String;
          setState(() {});
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildElectricBills() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Text("lbl_electric_bills".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildInputBox()
    ]);
  }

  /// Section Widget
  Widget _buildWifiOthers() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Text("lbl_wi_fi_others".tr, style: theme.textTheme.bodyLarge),
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
            "$selectWifi",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          isExpanded: true,
          items: wifiOther
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectWifi = value as String;
            setState(() {});
          },
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildDate() {
    return CustomTextFormField(
      controller: addPropertyDetailsForRoommateController.dateController,
      hintText: 'Select date',
      enableBorder: false,
      suffix: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2050));
          if (pickedDate != null) {
            addPropertyDetailsForRoommateController.dateController.text =
                '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
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
    );
  }

  /// Section Widget
  Widget _buildAvailable() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Text("lbl_available".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildDate()
    ]);
  }

  /// Section Widget
  Widget _buildTime() {
    return CustomTextFormField(
        controller: addPropertyDetailsForRoommateController.timeController,
        hintText: "lbl_enter_stay_time".tr,
        enableBorder: false,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildMinimumStay() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Text("lbl_minimum_stay".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildTime()
    ]);
  }

  /// Section Widget
  Widget _buildNext() {
    return Obx(() {
      return CustomElevatedButton(
        text:
            addPropertyDetailsForRoommateController.currentFormStage.value == 1
                ? "lbl_next".tr
                : "lbl_submit".tr,
        onPressed: () {
          addPropertyDetailsForRoommateController.savePropertyDetails();
        },
      );
    });
  }

  /// Section Widget
  Widget _buildBtnAndBg() {
    return Container(
        height: 112.v,
        padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
        decoration: AppDecoration.white,
        child: _buildNext());
  }

  Widget _buildMonthlyRent() {
    return CustomTextFormField(
      hintText: "Enter monthly rent",
      controller: addPropertyDetailsForRoommateController.monthlyRentController,
      enableBorder: false,
      suffix: Padding(
        padding: EdgeInsets.only(right: 16.h),
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
          items: ["RM"]
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {}); // Ensure the dropdown updates
          },
        ),
      ),
    );
  }

  Widget _buildDeposit() {
    return CustomTextFormField(
      hintText: "lbl_00".tr,
      controller: addPropertyDetailsForRoommateController.depositController,
      enableBorder: false,
      suffix: Padding(
        padding: EdgeInsets.only(right: 16.h),
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
            "RM",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          items: ["RM"]
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  /// Navigates to the addPersonalDetailsScreen when the action is triggered.
  onTapNext() {
    Get.toNamed(
      AppRoutes.addPersonalDetailsScreen,
    );
  }
}
