// import 'controller/personality_controller.dart';
// import 'models/chipview_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
// import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
// import 'package:uptm_secure_stay/widgets/custom_search_view.dart';

// class PersonalityScreen extends StatefulWidget {
//   const PersonalityScreen({super.key});

//   @override
//   State<PersonalityScreen> createState() => _PersonalityScreenState();
// }

// class _PersonalityScreenState extends State<PersonalityScreen> {
//   PersonalityController personalityController =
//       Get.put(PersonalityController());
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return GetBuilder(
//         init: PersonalityController(),
//         builder: (controller) => Scaffold(
//               backgroundColor: appTheme.white,
//               resizeToAvoidBottomInset: false,
//               body: SafeArea(
//                 child: Container(
//                     color: appTheme.gray100,
//                     width: double.maxFinite,
//                     child: Column(children: [
//                       _buildHeader(),
//                       Expanded(
//                           child: ListView(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 10.v, horizontal: 16.h),
//                         primary: true,
//                         shrinkWrap: false,
//                         children: [
//                           Text("msg_select_minimum_five".tr,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.center,
//                               style: CustomTextStyles.bodyLargeSFProDisplay
//                                   .copyWith(height: 1.50.v)),
//                           SizedBox(height: 16.v),
//                           CustomSearchView(
//                               controller:
//                                   personalityController.searchController,
//                               onChanged: (p0) {},
//                               onSubmit: (p0) {},
//                               suffix: SizedBox(),
//                               hintText: "lbl_search_tags".tr),
//                           SizedBox(height: 16.v),
//                           Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text("lbl_suggested".tr,
//                                   style: theme.textTheme.titleMedium)),
//                           SizedBox(height: 16.v),
//                           _buildChipView(),
//                           SizedBox(
//                             height: 142.v,
//                           ),
//                         ],
//                       )),
//                       RichText(
//                           text: TextSpan(children: [
//                             TextSpan(
//                                 text: "lbl_4".tr,
//                                 style: CustomTextStyles.titleLargeRegular),
//                             TextSpan(
//                                 text: "lbl_5".tr,
//                                 style: CustomTextStyles.titleLargeRegular),
//                             TextSpan(
//                                 text: "lbl_selected".tr,
//                                 style: CustomTextStyles.titleLargeRegular)
//                           ]),
//                           textAlign: TextAlign.center),
//                       SizedBox(
//                         height: 16.v,
//                       ),
//                       _buildContinue(),
//                     ])),
//               ),
//             ));
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
//                 margin: EdgeInsets.only(left: 20.h, top: 3.v, bottom: 4.v)),
//             centerTitle: true,
//             title: AppbarSubtitle(text: "lbl_personality".tr),
//             actions: [
//               AppbarSubtitleTwo(
//                   text: "lbl_4_5".tr,
//                   margin: EdgeInsets.fromLTRB(16.h, 1.v, 16.h, 6.v))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildChipView() {
//     return Wrap(
//       runSpacing: 16.v,
//       spacing: 16.h,
//       children:
//           List<Widget>.generate(listChipViewItemModelDetail.length, (index) {
//         return GestureDetector(
//           onTap: () {
//             personalityController.selectItemMethod(index);
//           },
//           child: Container(
//             height: 40.v,
//             padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
//             decoration: ShapeDecoration(
//               color: listChipViewItemModelDetail[index].isSelected == true
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
//                   listChipViewItemModelDetail[index].tag,
//                   style: TextStyle(
//                     color: listChipViewItemModelDetail[index].isSelected == true
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

//   /// Navigates to the livingHabitsScreen when the action is triggered.
//   onTapContinue() {
//     Get.toNamed(
//       AppRoutes.livingHabitsScreen,
//     );
//   }
// }
