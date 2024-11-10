// import 'package:flutter_svg/flutter_svg.dart';

// import 'controller/living_habits_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
// import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
// // import 'package:uptm_secure_stay/presentation/basic_details_add_success_dialog/basic_details_add_success_dialog.dart';
// // import 'package:uptm_secure_stay/presentation/basic_details_add_success_dialog/controller/basic_details_add_success_controller.dart';

// class LivingHabitsScreen extends StatefulWidget {
//   const LivingHabitsScreen({super.key});

//   @override
//   State<LivingHabitsScreen> createState() => _LivingHabitsScreenState();
// }

// class _LivingHabitsScreenState extends State<LivingHabitsScreen> {
//   LivingHabitsController livingHabitsController =
//       Get.put(LivingHabitsController());

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return GetBuilder<LivingHabitsController>(
//       init: LivingHabitsController(),
//       builder: (controller) => Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: appTheme.white,
//         body: SafeArea(
//           child: Container(
//               color: appTheme.gray100,
//               width: double.maxFinite,
//               child: Column(children: [
//                 _buildHeader(),
//                 Expanded(
//                     child: ListView(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 10.v, horizontal: 16.h),
//                   primary: true,
//                   shrinkWrap: false,
//                   children: [
//                     Text("msg_select_minimum_five".tr,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeSFProDisplay
//                             .copyWith(height: 1.50.v)),
//                     SizedBox(height: 16.v),
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text("lbl_living_habits".tr,
//                             style: theme.textTheme.titleMedium)),
//                     SizedBox(height: 16.v),
//                     _buildDailyColumn(),
//                     SizedBox(height: 16.v),
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text("lbl_food_habits".tr,
//                             style: theme.textTheme.titleMedium)),
//                     SizedBox(height: 16.v),
//                     _buildFruitsColumn(),
//                     SizedBox(height: 5.v),
//                   ],
//                 )),
//                 _buildCompleteColumn(),
//               ])),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildHeader() {
//     return Container(
//         padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
//         decoration: AppDecoration.outlineGray10001,
//         child: CustomAppBar(
//             leadingWidth: 44.h,
//             leading: AppbarLeadingImage(
//                 onTap: () {
//                   Get.back();
//                 },
//                 imagePath: ImageConstant.imgIcArrowLeft,
//                 margin: EdgeInsets.only(left: 20.h, top: 2.v, bottom: 5.v)),
//             centerTitle: true,
//             title: AppbarSubtitle(text: "lbl_living_habits".tr),
//             actions: [
//               AppbarSubtitleTwo(
//                   text: "lbl_5_5".tr,
//                   margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildDailyColumn() {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
//         decoration: AppDecoration.white
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("lbl_smoking".tr, style: theme.textTheme.bodyLarge),
//               SizedBox(height: 8.v),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.daily.value =
//                                 !livingHabitsController.daily.value;
//                             livingHabitsController.occasionally.value = false;
//                             livingHabitsController.never.value = false;
//                           },
//                           child: livingHabitsController.daily.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_daily".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.occasionally.value =
//                                 !livingHabitsController.occasionally.value;
//                             livingHabitsController.daily.value = false;
//                             livingHabitsController.never.value = false;
//                           },
//                           child:
//                               livingHabitsController.occasionally.value == true
//                                   ? SvgPicture.asset(
//                                       "assets/images/check box theme.svg",
//                                       height: 20.adaptSize,
//                                       width: 20.adaptSize,
//                                     )
//                                   : SvgPicture.asset(
//                                       "assets/images/check box.svg",
//                                       height: 20.adaptSize,
//                                       width: 20.adaptSize,
//                                     )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_occasionally".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.never.value =
//                                 !livingHabitsController.never.value;
//                             livingHabitsController.occasionally.value = false;
//                             livingHabitsController.daily.value = false;
//                           },
//                           child: livingHabitsController.never.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_never".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//               ]),
//               SizedBox(height: 20.v),
//               Text("lbl_drinking".tr, style: theme.textTheme.bodyLarge),
//               SizedBox(height: 8.v),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.daily1.value =
//                                 !livingHabitsController.daily1.value;
//                             livingHabitsController.occasionally1.value = false;
//                             livingHabitsController.never1.value = false;
//                           },
//                           child: livingHabitsController.daily1.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_daily".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.occasionally1.value =
//                                 !livingHabitsController.occasionally1.value;
//                             livingHabitsController.daily1.value = false;
//                             livingHabitsController.never1.value = false;
//                           },
//                           child:
//                               livingHabitsController.occasionally1.value == true
//                                   ? SvgPicture.asset(
//                                       "assets/images/check box theme.svg",
//                                       height: 20.adaptSize,
//                                       width: 20.adaptSize,
//                                     )
//                                   : SvgPicture.asset(
//                                       "assets/images/check box.svg",
//                                       height: 20.adaptSize,
//                                       width: 20.adaptSize,
//                                     )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_occasionally".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.never1.value =
//                                 !livingHabitsController.never1.value;
//                             livingHabitsController.occasionally1.value = false;
//                             livingHabitsController.daily1.value = false;
//                           },
//                           child: livingHabitsController.never1.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_never".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//               ]),
//               SizedBox(height: 20.v),
//               Text("lbl_guest".tr, style: theme.textTheme.bodyLarge),
//               SizedBox(height: 8.v),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.daily2.value =
//                                 !livingHabitsController.daily2.value;
//                             livingHabitsController.occasionally2.value = false;
//                             livingHabitsController.never2.value = false;
//                           },
//                           child: livingHabitsController.daily2.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_daily".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.occasionally2.value =
//                                 !livingHabitsController.occasionally2.value;
//                             livingHabitsController.daily2.value = false;
//                             livingHabitsController.never2.value = false;
//                           },
//                           child:
//                               livingHabitsController.occasionally2.value == true
//                                   ? SvgPicture.asset(
//                                       "assets/images/check box theme.svg",
//                                       height: 20.adaptSize,
//                                       width: 20.adaptSize,
//                                     )
//                                   : SvgPicture.asset(
//                                       "assets/images/check box.svg",
//                                       height: 20.adaptSize,
//                                       width: 20.adaptSize,
//                                     )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_occasionally".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.never2.value =
//                                 !livingHabitsController.never2.value;
//                             livingHabitsController.occasionally2.value = false;
//                             livingHabitsController.daily2.value = false;
//                           },
//                           child: livingHabitsController.never2.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_never".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//               ]),
//               SizedBox(height: 20.v),
//               Text("lbl_pets".tr, style: theme.textTheme.bodyLarge),
//               SizedBox(height: 8.v),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.have.value =
//                                 !livingHabitsController.have.value;
//                             livingHabitsController.doNotHave.value = false;
//                             livingHabitsController.maybe.value = false;
//                           },
//                           child: livingHabitsController.have.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_have".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.doNotHave.value =
//                                 !livingHabitsController.doNotHave.value;
//                             livingHabitsController.have.value = false;
//                             livingHabitsController.maybe.value = false;
//                           },
//                           child: livingHabitsController.doNotHave.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_don_t_have".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.maybe.value =
//                                 !livingHabitsController.maybe.value;
//                             livingHabitsController.have.value = false;
//                             livingHabitsController.doNotHave.value = false;
//                           },
//                           child: livingHabitsController.maybe.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_maybe".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//               ])
//             ]));
//   }

//   /// Section Widget
//   Widget _buildFruitsColumn() {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
//         decoration: AppDecoration.white
//             .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.fruits.value =
//                                 !livingHabitsController.fruits.value;
//                             livingHabitsController.vegetables.value = false;
//                             livingHabitsController.milk.value = false;
//                           },
//                           child: livingHabitsController.fruits.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_fruits".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.vegetables.value =
//                                 !livingHabitsController.vegetables.value;
//                             livingHabitsController.fruits.value = false;
//                             livingHabitsController.milk.value = false;
//                           },
//                           child: livingHabitsController.vegetables.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_vegitables".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.milk.value =
//                                 !livingHabitsController.milk.value;
//                             livingHabitsController.vegetables.value = false;
//                             livingHabitsController.fruits.value = false;
//                           },
//                           child: livingHabitsController.milk.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_milk".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//               ]),
//               SizedBox(height: 20.v),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.snacks.value =
//                                 !livingHabitsController.snacks.value;
//                             livingHabitsController.sweets.value = false;
//                             livingHabitsController.others.value = false;
//                           },
//                           child: livingHabitsController.snacks.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_snacks".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.sweets.value =
//                                 !livingHabitsController.sweets.value;
//                             livingHabitsController.snacks.value = false;
//                             livingHabitsController.others.value = false;
//                           },
//                           child: livingHabitsController.sweets.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_sweets".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () => GestureDetector(
//                           onTap: () {
//                             livingHabitsController.others.value =
//                                 !livingHabitsController.others.value;
//                             livingHabitsController.snacks.value = false;
//                             livingHabitsController.sweets.value = false;
//                           },
//                           child: livingHabitsController.others.value == true
//                               ? SvgPicture.asset(
//                                   "assets/images/check box theme.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )
//                               : SvgPicture.asset(
//                                   "assets/images/check box.svg",
//                                   height: 20.adaptSize,
//                                   width: 20.adaptSize,
//                                 )),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Text("lbl_others".tr,
//                             style: theme.textTheme.bodyLarge)),
//                   ],
//                 ),
//               ]),
//               SizedBox(height: 2.v)
//             ]));
//   }

//   /// Section Widget
//   // Widget _buildCompleteColumn() {
//   //   return Container(
//   //       height: 112.v,
//   //       padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.v, 40.v),
//   //       decoration: AppDecoration.white,
//   //       child: CustomElevatedButton(
//   //           text: "lbl_complete".tr,
//   //           onPressed: () {
//   //             SharedPreferencesClass s1 = SharedPreferencesClass();
//   //             s1.setData(
//   //               false,
//   //               true,
//   //             );
//   //             onTapComplete();
//   //           }));
//   // }

//   /// Displays a dialog with the [BasicDetailsAddSuccessDialog] content.
//   // onTapComplete() {
//   //   Get.dialog(AlertDialog(
//   //     backgroundColor: Colors.transparent,
//   //     contentPadding: EdgeInsets.zero,
//   //     insetPadding: const EdgeInsets.only(left: 0),
//   //     content: BasicDetailsAddSuccessDialog(
//   //       Get.put(
//   //         BasicDetailsAddSuccessController(),
//   //       ),
//   //     ),
//   //   ));
//   // }
// }
