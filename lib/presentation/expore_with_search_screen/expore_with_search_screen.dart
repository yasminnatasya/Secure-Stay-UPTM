// import '../expore_with_search_screen/widgets/ichome_item_widget.dart';
// import 'controller/expore_with_search_controller.dart';
// import 'models/ichome_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
// import 'package:uptm_secure_stay/presentation/chats1_page/chats1_page.dart';
// import 'package:uptm_secure_stay/presentation/expore_page/expore_page.dart';
// import 'package:uptm_secure_stay/presentation/home_screen_tab_container_page/home_screen_tab_container_page.dart';
// import 'package:uptm_secure_stay/presentation/profile_page/profile_page.dart';
// import 'package:uptm_secure_stay/widgets/custom_bottom_bar.dart';
// import 'package:uptm_secure_stay/widgets/custom_checkbox_button.dart';
// import 'package:uptm_secure_stay/widgets/custom_floating_button.dart';
// import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';
// import 'package:uptm_secure_stay/widgets/custom_search_view.dart';

// // ignore_for_file: must_be_immutable
// class ExporeWithSearchScreen extends GetWidget<ExporeWithSearchController> {
//   const ExporeWithSearchScreen({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SizedBox(
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               _buildHeader(),
//               SizedBox(
//                 height: 785.v,
//                 width: double.maxFinite,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Align(
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                         height: 785.v,
//                         width: double.maxFinite,
//                         child: Stack(
//                           alignment: Alignment.topCenter,
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgRectangle4388785x428,
//                               height: 785.v,
//                               width: 428.h,
//                               alignment: Alignment.center,
//                             ),
//                             Align(
//                               alignment: Alignment.topCenter,
//                               child: Container(
//                                 height: 526.v,
//                                 width: 412.h,
//                                 margin: EdgeInsets.only(top: 16.v),
//                                 child: Stack(
//                                   alignment: Alignment.bottomRight,
//                                   children: [
//                                     Opacity(
//                                       opacity: 0.4,
//                                       child: CustomImageView(
//                                         imagePath: ImageConstant.imgVector1,
//                                         height: 360.v,
//                                         width: 361.h,
//                                         alignment: Alignment.centerRight,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         right: 11.h,
//                                         bottom: 64.v,
//                                       ),
//                                       child: CustomIconButton(
//                                         height: 48.adaptSize,
//                                         width: 48.adaptSize,
//                                         padding: EdgeInsets.all(12.h),
//                                         decoration: IconButtonStyleHelper
//                                             .outlineBlackTL24,
//                                         alignment: Alignment.bottomRight,
//                                         child: CustomImageView(
//                                           imagePath:
//                                               ImageConstant.imgGroup38158,
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.bottomLeft,
//                                       child: Padding(
//                                         padding: EdgeInsets.only(
//                                           left: 21.h,
//                                           bottom: 22.v,
//                                         ),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             _buildLocation20015(),
//                                             SizedBox(height: 40.v),
//                                             _buildIcHome(),
//                                             SizedBox(height: 34.v),
//                                             Padding(
//                                               padding:
//                                                   EdgeInsets.only(left: 126.h),
//                                               child: CustomIconButton(
//                                                 height: 28.adaptSize,
//                                                 width: 28.adaptSize,
//                                                 padding: EdgeInsets.all(6.h),
//                                                 decoration:
//                                                     IconButtonStyleHelper
//                                                         .outlineGray,
//                                                 child: CustomImageView(
//                                                   imagePath:
//                                                       ImageConstant.imgLocation,
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(height: 36.v),
//                                             Padding(
//                                               padding:
//                                                   EdgeInsets.only(left: 24.h),
//                                               child: _buildLocation20015(),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     _buildDetails(),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     _buildBed(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: _buildBottomBar(),
//         floatingActionButton: _buildFloatingActionButton(),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildHeader() {
//     return Container(
//       padding: EdgeInsets.fromLTRB(171.h, 18.v, 171.h, 17.v),
//       decoration: AppDecoration.outlineGray10001,
//       child: Text(
//         "lbl_explore".tr,
//         style: theme.textTheme.headlineSmall,
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildIcHome() {
//     return Padding(
//       padding: EdgeInsets.only(right: 46.h),
//       child: Obx(
//         () => GridView.builder(
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             mainAxisExtent: 30.v,
//             crossAxisCount: 3,
//             mainAxisSpacing: 138.h,
//             crossAxisSpacing: 138.h,
//           ),
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: controller
//               .exporeWithSearchModelObj.value.ichomeItemList.value.length,
//           itemBuilder: (context, index) {
//             IchomeItemModel model = controller
//                 .exporeWithSearchModelObj.value.ichomeItemList.value[index];
//             return IchomeItemWidget(
//               model,
//             );
//           },
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildDetails() {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomSearchView(
//             controller: controller.searchController,
//             hintText: "lbl_stuyesant_ave".tr,
//             onSubmit: (p0) {},
//             onChanged: (p0) {},
//           ),
//           SizedBox(height: 16.v),
//           Row(
//             children: [
//               Container(
//                 width: 66.h,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 12.h,
//                   vertical: 7.v,
//                 ),
//                 decoration: AppDecoration.fillPrimary.copyWith(
//                   borderRadius: BorderRadiusStyle.roundedBorder6,
//                 ),
//                 child: Text(
//                   "lbl_room".tr,
//                   style: theme.textTheme.bodyLarge,
//                 ),
//               ),
//               Container(
//                 width: 103.h,
//                 margin: EdgeInsets.only(left: 16.h),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 12.h,
//                   vertical: 7.v,
//                 ),
//                 decoration: AppDecoration.outlineBlack900.copyWith(
//                   borderRadius: BorderRadiusStyle.roundedBorder6,
//                 ),
//                 child: Text(
//                   "lbl_roommate".tr,
//                   style: CustomTextStyles.bodyLargeGray800,
//                 ),
//               ),
//               Container(
//                 width: 65.h,
//                 margin: EdgeInsets.only(left: 16.h),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 12.h,
//                   vertical: 7.v,
//                 ),
//                 decoration: AppDecoration.outlineBlack900.copyWith(
//                   borderRadius: BorderRadiusStyle.roundedBorder6,
//                 ),
//                 child: Text(
//                   "lbl_event".tr,
//                   style: CustomTextStyles.bodyLargeGray800,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildBed() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.only(
//           left: 16.h,
//           top: 566.v,
//           bottom: 95.v,
//         ),
//         child: IntrinsicWidth(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 12.v),
//                   decoration: AppDecoration.white.copyWith(
//                     borderRadius: BorderRadiusStyle.roundedBorder12,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomImageView(
//                         imagePath: ImageConstant.imgRectangle17858,
//                         height: 100.adaptSize,
//                         width: 100.adaptSize,
//                         radius: BorderRadius.circular(
//                           12.h,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 8.v),
//                         child: Column(
//                           children: [
//                             _buildShermanOaks(
//                               shermanOaks: "lbl_sherman_oaks".tr,
//                               price: "lbl_40_mo".tr,
//                             ),
//                             SizedBox(height: 14.v),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Obx(
//                                   () => CustomCheckboxButton(
//                                     text: "lbl_02_bed".tr,
//                                     value: controller.bed.value,
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 1.v),
//                                     onChange: (value) {
//                                       controller.bed.value = value;
//                                     },
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 20.h),
//                                   child: Obx(
//                                     () => CustomCheckboxButton(
//                                       text: "lbl_03_bath".tr,
//                                       value: controller.bath.value,
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 1.v),
//                                       onChange: (value) {
//                                         controller.bath.value = value;
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 CustomImageView(
//                                   imagePath:
//                                       ImageConstant.imgIcSquarefeetGray900,
//                                   height: 16.adaptSize,
//                                   width: 16.adaptSize,
//                                   margin: EdgeInsets.only(left: 20.h),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 5.h),
//                                   child: Text(
//                                     "lbl_2468_sqft".tr,
//                                     style: theme.textTheme.bodySmall,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(left: 16.h),
//                   padding: EdgeInsets.all(12.h),
//                   decoration: AppDecoration.white.copyWith(
//                     borderRadius: BorderRadiusStyle.roundedBorder12,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomImageView(
//                         imagePath: ImageConstant.imgBg1,
//                         height: 100.adaptSize,
//                         width: 100.adaptSize,
//                         radius: BorderRadius.circular(
//                           12.h,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 12.h,
//                           bottom: 8.v,
//                         ),
//                         child: Column(
//                           children: [
//                             _buildShermanOaks(
//                               shermanOaks: "lbl_sherman_oaks".tr,
//                               price: "lbl_40_mo".tr,
//                             ),
//                             SizedBox(height: 12.v),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Obx(
//                                   () => CustomCheckboxButton(
//                                     text: "lbl_02_bed".tr,
//                                     value: controller.bed1.value,
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 1.v),
//                                     onChange: (value) {
//                                       controller.bed1.value = value;
//                                     },
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 20.h),
//                                   child: Obx(
//                                     () => CustomCheckboxButton(
//                                       text: "lbl_03_bath".tr,
//                                       value: controller.bath1.value,
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 1.v),
//                                       onChange: (value) {
//                                         controller.bath1.value = value;
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 CustomImageView(
//                                   imagePath:
//                                       ImageConstant.imgIcSquarefeetGray900,
//                                   height: 16.adaptSize,
//                                   width: 16.adaptSize,
//                                   margin: EdgeInsets.only(left: 20.h),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 5.h),
//                                   child: Text(
//                                     "lbl_2468_sqft".tr,
//                                     style: theme.textTheme.bodySmall,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildBottomBar() {
//     return CustomBottomBar(
//       onChanged: (BottomBarEnum type) {
//         Get.toNamed(getCurrentRoute(type), id: 1);
//       },
//     );
//   }

//   /// Section Widget
//   Widget _buildFloatingActionButton() {
//     return CustomFloatingButton(
//       height: 48,
//       width: 48,
//       backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
//       decoration: FloatingButtonStyleHelper.fillOnPrimaryContainerTL24,
//       child: CustomImageView(
//         imagePath: ImageConstant.imgSearchGray900,
//         height: 24.0.v,
//         width: 24.0.h,
//       ),
//     );
//   }

//   /// Common widget
//   Widget _buildLocation20015() {
//     return SizedBox(
//       height: 29.v,
//       width: 23.h,
//       child: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgGroup,
//             height: 29.v,
//             width: 23.h,
//             alignment: Alignment.center,
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               height: 18.adaptSize,
//               width: 18.adaptSize,
//               margin: EdgeInsets.only(top: 3.v),
//               padding: EdgeInsets.all(3.h),
//               decoration: AppDecoration.white.copyWith(
//                 borderRadius: BorderRadiusStyle.circleBorder9,
//               ),
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgIcHomeGray900,
//                 height: 12.adaptSize,
//                 width: 12.adaptSize,
//                 alignment: Alignment.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Common widget
//   Widget _buildShermanOaks({
//     required String shermanOaks,
//     required String price,
//   }) {
//     return SizedBox(
//       width: 214.h,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 8.v),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   shermanOaks,
//                   style: theme.textTheme.titleMedium!.copyWith(
//                     color: appTheme.gray900,
//                   ),
//                 ),
//                 SizedBox(height: 8.v),
//                 Text(
//                   price,
//                   style: theme.textTheme.bodyMedium!.copyWith(
//                     color: appTheme.gray900,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 40.v),
//             child: CustomIconButton(
//               height: 24.adaptSize,
//               width: 24.adaptSize,
//               padding: EdgeInsets.all(4.h),
//               decoration: IconButtonStyleHelper.outlineBlack,
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgLike,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   ///Handling route based on bottom click actions
//   String getCurrentRoute(BottomBarEnum type) {
//     switch (type) {
//       case BottomBarEnum.Home:
//         return AppRoutes.homeScreenTabContainerPage;
//       case BottomBarEnum.Explore:
//         return AppRoutes.exporePage;
//       case BottomBarEnum.Chats:
//         return AppRoutes.chats1Page;
//       case BottomBarEnum.Profile:
//         return AppRoutes.profilePage;
//       default:
//         return "/";
//     }
//   }

//   ///Handling page based on route
//   Widget getCurrentPage(String currentRoute) {
//     switch (currentRoute) {
//       case AppRoutes.homeScreenTabContainerPage:
//         return HomeScreenTabContainerPage();
//       case AppRoutes.exporePage:
//         return ExporePage();
//       case AppRoutes.chats1Page:
//         return Chats1Page();
//       case AppRoutes.profilePage:
//         return ProfilePage();
//       default:
//         return DefaultWidget();
//     }
//   }
// }
