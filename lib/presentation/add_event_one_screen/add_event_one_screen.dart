import 'controller/add_event_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class AddEventOneScreen extends StatefulWidget {
  const AddEventOneScreen({super.key});

  @override
  State<AddEventOneScreen> createState() => _AddEventOneScreenState();
}

class _AddEventOneScreenState extends State<AddEventOneScreen> {
  AddEventOneController addEventOneController =
      Get.put(AddEventOneController());

  String selectEntryPrice = "USD";
  List<String> entryPrice = [
    "USD",
    "INR",
    "EUR",
    "GBP",
    "AUD",
  ];

  String selectEntryType = "Select";
  List<String> entryType = [
    "day",
    "week",
    "month",
    "year",
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
                  child: ListView(
                primary: true,
                shrinkWrap: false,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                children: [
                  _buildCover(),
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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_entry_price".tr,
                          style: theme.textTheme.bodyLarge)),
                  SizedBox(height: 5.v),
                  _buildEntryPrice(),
                  SizedBox(height: 16.v),
                  _buildMasterDropdown(),
                  SizedBox(height: 16.v),
                  _buildMasterDropdown1(),
                  SizedBox(height: 16.v),
                  _buildMasterUsername1(),
                  SizedBox(height: 16.v),
                  _buildMasterUsername2(),
                  SizedBox(height: 16.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_select_tag".tr,
                          style: theme.textTheme.titleMedium)),
                  SizedBox(height: 16.v),
                  _buildMusic(),
                ],
              )),
            ])),
      ),
    );
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
                  title: AppbarSubtitle(text: "lbl_add_event".tr),
                  actions: [
                    AppbarSubtitleTwo(
                        text: "1/2",
                        margin: EdgeInsets.fromLTRB(16.h, 3.v, 16.h, 4.v))
                  ])
            ]));
  }

  /// Section Widget
  Widget _buildCover() {
    return Container(
        height: 196.v,
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgIcGallery,
                  height: 40.adaptSize,
                  width: 40.adaptSize),
              SizedBox(height: 12.v),
              Text("lbl_add_cover_image".tr,
                  style: CustomTextStyles.titleMediumSFProDisplayGray800)
            ]));
  }

  /// Section Widget
  Widget _buildFieldlable() {
    return CustomTextFormField(
      controller: addEventOneController.fieldlableController,
      hintText: "lbl_title".tr,
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_event_title".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildFieldlable()
    ]);
  }

  /// Section Widget
  Widget _buildPlaceholder() {
    return CustomTextFormField(
      controller: addEventOneController.placeholderController,
      hintText: "lbl_description".tr,
      maxLines: 6,
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterTextArea() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_event_description".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildPlaceholder()
    ]);
  }

  /// Section Widget
  Widget _buildEntryPrice() {
    return CustomTextFormField(
      hintText: "lbl_00".tr,
      controller: addEventOneController.entryPriceController,
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
            "$selectEntryPrice",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          //isExpanded: true,
          items: entryPrice
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {
            selectEntryPrice = value as String;
            setState(() {});
          },
        ),
      ),
    );
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
          "$selectEntryType",
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
        isExpanded: true,
        items: entryType
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          selectEntryType = value as String;
          setState(() {});
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMasterDropdown() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_entry_type".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildInputBox()
    ]);
  }

  /// Section Widget
  Widget _buildDate() {
    return CustomTextFormField(
      controller: addEventOneController.dateController,
      enableBorder: false,
      hintText: 'Select date',
      suffix: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2050));
          if (pickedDate != null) {
            addEventOneController.dateController.text =
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
  Widget _buildMasterDropdown1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_date".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildDate()
    ]);
  }

  /// Section Widget
  Widget _buildTime() {
    return CustomTextFormField(
        controller: addEventOneController.timeController,
        hintText: "msg_enter_start_time".tr,
        enableBorder: false,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(12.h, 15.v, 16.h, 15.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgIcClock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 54.v),
        contentPadding: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 16.v));
  }

  /// Section Widget
  Widget _buildMasterUsername1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_start_time".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildTime()
    ]);
  }

  /// Section Widget
  Widget _buildTime1() {
    return CustomTextFormField(
        controller: addEventOneController.timeController1,
        enableBorder: false,
        hintText: "lbl_enter_end_time".tr,
        textInputAction: TextInputAction.done,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(12.h, 15.v, 16.h, 15.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgIcClock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 54.v),
        contentPadding: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 16.v));
  }

  /// Section Widget
  Widget _buildMasterUsername2() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_end_time".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildTime1()
    ]);
  }

  /// Section Widget
  Widget _buildMusic() {
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
                            addEventOneController.music.value =
                                !addEventOneController.music.value;
                          },
                          child: addEventOneController.music.value == true
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
                        child: Text("lbl_music".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addEventOneController.newYear.value =
                                !addEventOneController.newYear.value;
                          },
                          child: addEventOneController.newYear.value == true
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
                        child: Text("lbl_new_year".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addEventOneController.birthday.value =
                                !addEventOneController.birthday.value;
                          },
                          child: addEventOneController.birthday.value == true
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
                        child: Text("lbl_birthday".tr,
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
                              addEventOneController.religious.value =
                                  !addEventOneController.religious.value;
                            },
                            child: addEventOneController.religious.value == true
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
                          child: Text("lbl_religious".tr,
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
                              addEventOneController.popSongs.value =
                                  !addEventOneController.popSongs.value;
                            },
                            child: addEventOneController.popSongs.value == true
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
                          child: Text("lbl_pop_songs".tr,
                              style: theme.textTheme.bodyLarge)),
                    ],
                  ),
                ],
              ),
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
        height: 112.v,
        padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
        decoration: AppDecoration.white,
        child: _buildNext());
  }

  /// Navigates to the eventLocationScreen when the action is triggered.
  onTapNext() {
    Get.toNamed(
      AppRoutes.eventLocationScreen,
    );
  }
}
