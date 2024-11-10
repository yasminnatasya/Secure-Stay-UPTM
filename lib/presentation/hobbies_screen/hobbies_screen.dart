// import 'controller/hobbies_controller.dart';
// import 'models/frame1_item_model.dart';
// import 'models/frame3_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
// import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
// import 'package:uptm_secure_stay/widgets/custom_search_view.dart';

// class HobbiesScreen extends StatefulWidget {
//   const HobbiesScreen({super.key});

//   @override
//   State<HobbiesScreen> createState() => _HobbiesScreenState();
// }

// class _HobbiesScreenState extends State<HobbiesScreen> {
//   HobbiesController hobbiesController = Get.put(HobbiesController());
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return GetBuilder<HobbiesController>(
//       init: HobbiesController(),
//       builder: (controller) => Scaffold(
//         backgroundColor: appTheme.white,
//         resizeToAvoidBottomInset: false,
//         body: SafeArea(
//           child: Container(
//             color: appTheme.gray100,
//             width: double.maxFinite,
//             child: Column(children: [
//               _buildHeader(),
//               Expanded(
//                 child: ListView(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 10.v, horizontal: 16.h),
//                   primary: true,
//                   shrinkWrap: false,
//                   children: [
//                     Column(children: [
//                       Text("msg_select_minimum_five".tr,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: CustomTextStyles.bodyLargeSFProDisplay
//                               .copyWith(height: 1.50.v)),
//                       SizedBox(height: 16.v),
//                       CustomSearchView(
//                           controller: hobbiesController.searchController,
//                           onChanged: (p0) {},
//                           onSubmit: (p0) {},
//                           suffix: SizedBox(),
//                           hintText: "lbl_search_tags".tr),
//                       SizedBox(height: 16.v),
//                       Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text("lbl_creative".tr,
//                               style: theme.textTheme.titleMedium)),
//                       SizedBox(height: 16.v),
//                       _buildFrame1(),
//                       SizedBox(height: 16.v),
//                       Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text("lbl_activity".tr,
//                               style: theme.textTheme.titleMedium)),
//                       SizedBox(height: 16.v),
//                       _buildFrame2(),
//                       SizedBox(height: 5.v)
//                     ]),
//                   ],
//                 ),
//               ),
//               RichText(
//                   text: TextSpan(children: [
//                     TextSpan(
//                         text: "lbl_3".tr,
//                         style: CustomTextStyles.titleLargeRegular),
//                     TextSpan(
//                         text: "lbl_5".tr,
//                         style: CustomTextStyles.titleLargeRegular),
//                     TextSpan(
//                         text: "lbl_selected".tr,
//                         style: CustomTextStyles.titleLargeRegular)
//                   ]),
//                   textAlign: TextAlign.center),
//               SizedBox(
//                 height: 16.v,
//               ),
//               _buildContinue(),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildHeader() {
//     return Container(
//         padding: EdgeInsets.only(top: 18.v, bottom: 19.v),
//         decoration: AppDecoration.outlineGray10001,
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           SizedBox(height: 5.v),
//           CustomAppBar(
//               leadingWidth: 44.h,
//               leading: AppbarLeadingImage(
//                   onTap: () {
//                     Get.back();
//                   },
//                   imagePath: ImageConstant.imgIcArrowLeft,
//                   margin: EdgeInsets.only(left: 20.h, top: 5.v, bottom: 2.v)),
//               centerTitle: true,
//               title: AppbarSubtitle(text: "lbl_basic_habits".tr),
//               actions: [
//                 AppbarSubtitleTwo(
//                     text: "lbl_3_5".tr,
//                     margin: EdgeInsets.fromLTRB(16.h, 4.v, 16.h, 3.v))
//               ])
//         ]));
//   }

//   /// Section Widget
//   Widget _buildFrame1() {
//     return Wrap(
//       runSpacing: 16.v,
//       spacing: 16.h,
//       children:
//           List<Widget>.generate(listFrame1ItemModelDetail.length, (index) {
//         return GestureDetector(
//           onTap: () {
//             hobbiesController.selectCreativeMethod(index);
//           },
//           child: Container(
//             height: 40.v,
//             padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
//             decoration: ShapeDecoration(
//               color: listFrame1ItemModelDetail[index].isSelectCreative == true
//                   ? Color(0xFfFFD65C)
//                   : Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6.h)),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   listFrame1ItemModelDetail[index].tag,
//                   style: TextStyle(
//                     color: listFrame1ItemModelDetail[index].isSelectCreative ==
//                             true
//                         ? appTheme.gray900
//                         : appTheme.gray800,
//                     fontSize: 16.fSize,
//                     fontFamily: 'Neutrif Pro',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   /// Section Widget
//   Widget _buildFrame2() {
//     return Wrap(
//       runSpacing: 16.v,
//       spacing: 16.h,
//       children:
//           List<Widget>.generate(listFrame1ItemModelDetail.length, (index) {
//         return GestureDetector(
//           onTap: () {
//             hobbiesController.selectActivityMethod(index);
//           },
//           child: Container(
//             height: 40.v,
//             padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
//             decoration: ShapeDecoration(
//               color: listFrame3ItemModelDetail[index].isSelectActivity == true
//                   ? Color(0xFfFFD65C)
//                   : Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6.h)),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   listFrame3ItemModelDetail[index].tag,
//                   style: TextStyle(
//                     color: listFrame3ItemModelDetail[index].isSelectActivity ==
//                             true
//                         ? appTheme.gray900
//                         : appTheme.gray800,
//                     fontSize: 16.fSize,
//                     fontFamily: 'Neutrif Pro',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   /// Section Widget
//   Widget _buildContinue() {
//     return Container(
//         height: 112.v,
//         padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.v, 40.v),
//         decoration: AppDecoration.white,
//         child: CustomElevatedButton(
//             text: "lbl_continue".tr,
//             onPressed: () {
//               onTapContinue();
//             }));
//   }

//   /// Navigates to the personalityScreen when the action is triggered.
//   onTapContinue() {
//     Get.toNamed(
//       AppRoutes.personalityScreen,
//     );
//   }
// }
