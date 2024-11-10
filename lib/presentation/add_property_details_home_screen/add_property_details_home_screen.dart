import 'controller/add_property_details_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class AddPropertyDetailsHomeScreen extends StatefulWidget {
  const AddPropertyDetailsHomeScreen({super.key});

  @override
  State<AddPropertyDetailsHomeScreen> createState() =>
      _AddPropertyDetailsHomeScreenState();
}

class _AddPropertyDetailsHomeScreenState
    extends State<AddPropertyDetailsHomeScreen> {
  AddPropertyDetailsHomeController addPropertyDetailsHomeController =
      Get.put(AddPropertyDetailsHomeController());
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
    "adani electricity mumbai limited",
    "Torrent power limited",
    "Madhya gujrat vij company ltd",
    "Paschim gujrat vij company ltd",
    "Uttar gujrat vij company ltd",
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
      resizeToAvoidBottomInset: true,
      backgroundColor: appTheme.white,
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
                    Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "msg_upload_property2".tr,
                                  style: theme.textTheme.titleMedium),
                              TextSpan(
                                  text: "lbl_max_10_photos".tr,
                                  style: CustomTextStyles.titleMediumRedA200_1)
                            ]),
                            textAlign: TextAlign.left)),
                    SizedBox(height: 24.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            height: 88.adaptSize,
                            width: 88.adaptSize,
                            padding: EdgeInsets.all(25.h),
                            decoration: AppDecoration.white.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder12),
                            child: CustomImageView(
                                imagePath: ImageConstant.add,
                                height: 36.adaptSize,
                                width: 36.adaptSize,
                                alignment: Alignment.center))),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("msg_add_property_details".tr,
                            style: theme.textTheme.titleMedium)),
                    SizedBox(height: 16.v),
                    _buildMasterUsername(),
                    SizedBox(height: 16.v),
                    _buildMasterTextArea(),
                    SizedBox(height: 16.v),
                    _buildDetails(),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_home_amenties".tr,
                            style: theme.textTheme.titleMedium)),
                    SizedBox(height: 16.v),
                    _buildWifi(),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_monthly_rent".tr,
                            style: theme.textTheme.bodyLarge)),
                    SizedBox(height: 5.v),
                    _buildMonthlyRent(),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_deposit".tr,
                            style: theme.textTheme.bodyLarge)),
                    SizedBox(height: 5.v),
                    _buildDeposit(),
                    SizedBox(height: 16.v),
                    _buildElectricBills(),
                    SizedBox(height: 16.v),
                    _buildWifiOthers(),
                    SizedBox(height: 16.v),
                    _buildAvailable(),
                    SizedBox(height: 16.v),
                    _buildMinimumStay(),
                  ],
                ),
              ),
            ])),
      ),
      bottomNavigationBar: _buildBtnAndBg(),
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
            title: AppbarSubtitle(text: "lbl_add_property".tr),
            actions: [
              AppbarSubtitleTwo(
                  text: "2/3",
                  margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v))
            ]));
  }

  /// Section Widget
  Widget _buildFieldlable() {
    return CustomTextFormField(
      enableBorder: false,
      controller: addPropertyDetailsHomeController.fieldTittleController,
      hintText: "lbl_title".tr,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_property_title".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildFieldlable()
    ]);
  }

  /// Section Widget
  Widget _buildPlaceholder() {
    return CustomTextFormField(
      enableBorder: false,
      controller: addPropertyDetailsHomeController.placeholderController,
      hintText: "lbl_description".tr,
      maxLines: 6,
    );
  }

  /// Section Widget
  Widget _buildMasterTextArea() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_property_description".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildPlaceholder()
    ]);
  }

  /// Section Widget
  Widget _buildBeds() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: CustomTextFormField(
                controller: addPropertyDetailsHomeController.bedController,
                hintText: "lbl_beds".tr,
                hintStyle: theme.textTheme.titleSmall!,
                enableBorder: false,
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
                controller: addPropertyDetailsHomeController.bathsController,
                hintText: "lbl_baths".tr,
                hintStyle: theme.textTheme.titleSmall!,
                enableBorder: false,
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
                controller: addPropertyDetailsHomeController.sQFTController,
                hintText: "lbl_sqft".tr,
                hintStyle: theme.textTheme.titleSmall!,
                enableBorder: false,
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
                            addPropertyDetailsHomeController.wifi.value =
                                !addPropertyDetailsHomeController.wifi.value;
                          },
                          child: addPropertyDetailsHomeController.wifi.value ==
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
                            addPropertyDetailsHomeController.elevator.value =
                                !addPropertyDetailsHomeController
                                    .elevator.value;
                          },
                          child:
                              addPropertyDetailsHomeController.elevator.value ==
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
                            addPropertyDetailsHomeController.furniture.value =
                                !addPropertyDetailsHomeController
                                    .furniture.value;
                          },
                          child: addPropertyDetailsHomeController
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
                              addPropertyDetailsHomeController.generator.value =
                                  !addPropertyDetailsHomeController
                                      .generator.value;
                            },
                            child: addPropertyDetailsHomeController
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
                              addPropertyDetailsHomeController
                                      .airCondition.value =
                                  !addPropertyDetailsHomeController
                                      .airCondition.value;
                            },
                            child: addPropertyDetailsHomeController
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
      Text("lbl_electric_bills".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildInputBox()
    ]);
  }

  /// Section Widget
  Widget _buildWifiOthers() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_wi_fi_others".tr, style: theme.textTheme.bodyLarge),
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
      controller: addPropertyDetailsHomeController.dateController,
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
            addPropertyDetailsHomeController.dateController.text =
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
      Text("lbl_available".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildDate()
    ]);
  }

  /// Section Widget
  Widget _buildTime() {
    return CustomTextFormField(
        controller: addPropertyDetailsHomeController.timeController,
        hintText: "lbl_enter_stay_time".tr,
        enableBorder: false,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildMinimumStay() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_minimum_stay".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildTime()
    ]);
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
        height: 112.v,
        padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
        decoration: AppDecoration.white,
        child: _buildNext());
  }

  /// Common widget
  Widget _buildMonthlyRent() {
    return CustomTextFormField(
      hintText: "lbl_00".tr,
      controller: addPropertyDetailsHomeController.monthlyRentController,
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
            "$selectCurrency",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          //isExpanded: true,
          items: currency
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectCurrency = value as String;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _buildDeposit() {
    return CustomTextFormField(
      hintText: "lbl_00".tr,
      controller: addPropertyDetailsHomeController.depositController,
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
            "$selectDeposit",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          //isExpanded: true,
          items: deposit
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectDeposit = value as String;
            setState(() {});
          },
        ),
      ),
    );
  }

  /// Navigates to the addPropertyDetailsHome1Screen when the action is triggered.
  onTapNext() {
    Get.toNamed(
      AppRoutes.addPropertyDetailsHome1Screen,
    );
  }
}
