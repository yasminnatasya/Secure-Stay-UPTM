import 'controller/add_personal_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

class AddPersonalDetailsScreen extends StatefulWidget {
  const AddPersonalDetailsScreen({super.key});

  @override
  State<AddPersonalDetailsScreen> createState() =>
      _AddPersonalDetailsScreenState();
}

class _AddPersonalDetailsScreenState extends State<AddPersonalDetailsScreen> {
  AddPersonalDetailsController addPersonalDetailsController =
      AddPersonalDetailsController();

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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("msg_add_personal_details".tr,
                          style: theme.textTheme.titleMedium)),
                  SizedBox(height: 16.v),
                  _buildMasterUsername(),
                  SizedBox(height: 16.v),
                  _buildMasterUsername1(),
                  SizedBox(height: 16.v),
                  _buildMasterUsername2(),
                  SizedBox(height: 16.v),
                  _buildMasterUsername3(),
                  SizedBox(height: 16.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_interested_in".tr,
                          style: theme.textTheme.titleMedium)),
                  SizedBox(height: 16.v),
                  _buildStudents(),
                  SizedBox(height: 16.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_interested_in".tr,
                          style: theme.textTheme.titleMedium)),
                  SizedBox(height: 16.v),
                  _buildFootball(),
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
  Widget _buildFullName() {
    return CustomTextFormField(
      controller: addPersonalDetailsController.fullNameController,
      hintText: "Enter your full name",
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_full_name".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildFullName()
    ]);
  }

  /// Section Widget
  Widget _buildDuration() {
    return CustomTextFormField(
      controller: addPersonalDetailsController.durationController,
      hintText: "Enter your minimum stay",
      enableBorder: false,
    );
  }

  /// Section Widget
  Widget _buildMasterUsername1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_minimum_stay".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildDuration()
    ]);
  }

  /// Section Widget
  Widget _buildMasterUsername2() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_age".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      CustomTextFormField(
        controller: addPersonalDetailsController.ageController,
        hintText: "Enter your age",
        enableBorder: false,
      ),
    ]);
  }

  /// Section Widget
  Widget _buildFieldLabel() {
    return CustomTextFormField(
        controller: addPersonalDetailsController.occupationsController,
        hintText: "Enter Occupations",
        enableBorder: false,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildMasterUsername3() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_occupations".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 5.v),
      _buildFieldLabel()
    ]);
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
                            addPersonalDetailsController.students.value =
                                !addPersonalDetailsController.students.value;
                          },
                          child: addPersonalDetailsController.students.value ==
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
                            addPersonalDetailsController.male.value =
                                !addPersonalDetailsController.male.value;
                          },
                          child: addPersonalDetailsController.male.value == true
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
                            addPersonalDetailsController.petLover.value =
                                !addPersonalDetailsController.petLover.value;
                          },
                          child: addPersonalDetailsController.petLover.value ==
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
                              addPersonalDetailsController.vegetarian.value =
                                  !addPersonalDetailsController
                                      .vegetarian.value;
                            },
                            child: addPersonalDetailsController
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
                              addPersonalDetailsController.nonsmoker.value =
                                  !addPersonalDetailsController.nonsmoker.value;
                            },
                            child: addPersonalDetailsController
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

  Widget _buildFootball() {
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
                            addPersonalDetailsController.football.value =
                                !addPersonalDetailsController.football.value;
                          },
                          child: addPersonalDetailsController.football.value ==
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
                        child: Text("lbl_football2".tr,
                            style: theme.textTheme.bodyLarge)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () {
                            addPersonalDetailsController.music.value =
                                !addPersonalDetailsController.music.value;
                          },
                          child:
                              addPersonalDetailsController.music.value == true
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
                            addPersonalDetailsController.gym.value =
                                !addPersonalDetailsController.gym.value;
                          },
                          child: addPersonalDetailsController.gym.value == true
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
                        child: Text("lbl_gym3".tr,
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
                              addPersonalDetailsController.netflix.value =
                                  !addPersonalDetailsController.netflix.value;
                            },
                            child: addPersonalDetailsController.netflix.value ==
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
                          child: Text("lbl_netflix".tr,
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
                              addPersonalDetailsController.hockey.value =
                                  !addPersonalDetailsController.hockey.value;
                            },
                            child: addPersonalDetailsController.hockey.value ==
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
                          child: Text("lbl_hockey".tr,
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

  /// Navigates to the addPropertyLocationScreen when the action is triggered.
  onTapNext() {
    Get.toNamed(
      AppRoutes.addPropertyLocationScreen,
    );
  }
}
