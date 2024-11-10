// import '../property_add_success_dialog/controller/property_add_success_controller.dart';
// import '../property_add_success_dialog/property_add_success_dialog.dart';
// import 'controller/event_location_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_leading_image.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/appbar_subtitle_two.dart';
// import 'package:uptm_secure_stay/widgets/app_bar/custom_app_bar.dart';
// import 'package:uptm_secure_stay/widgets/custom_elevated_button.dart';
// import 'package:uptm_secure_stay/widgets/custom_text_form_field.dart';

// class EventLocationScreen extends StatefulWidget {
//   const EventLocationScreen({super.key});

//   @override
//   State<EventLocationScreen> createState() => _EventLocationScreenState();
// }

// class _EventLocationScreenState extends State<EventLocationScreen> {
//   EventLocationController eventLocationController =
//       Get.put(EventLocationController());

//   String selectCity = "select city";
//   List<String> city = ["Broome", "surat", "rajkot", "ahmedabad", "vadodara"];
//   String selectState = "select state";
//   List<String> state = [
//     "New york",
//     "Gujarat",
//     "Delhi",
//     "Maharashtra",
//     "Rajasthan",
//     "Karnataka"
//   ];
//   String selectCountry = "select country";
//   List<String> country = [
//     "USA",
//     "India",
//     "UK",
//     "Australia",
//     "Canada",
//     "China",
//     "Japan"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return Scaffold(
//       backgroundColor: appTheme.white,
//       resizeToAvoidBottomInset: true,
//       bottomNavigationBar: _buildBtnAndBg(),
//       body: SafeArea(
//         child: Container(
//           color: appTheme.gray100,
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               _buildHeader(),
//               Expanded(
//                 child: ListView(
//                   primary: true,
//                   shrinkWrap: false,
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
//                   children: [
//                     _buildMasterUsername1(),
//                     SizedBox(height: 16.v),
//                     _buildMasterUsername2(),
//                     SizedBox(height: 16.v),
//                     _buildMasterDropdown1(),
//                     SizedBox(height: 16.v),
//                     _buildMasterDropdown2(),
//                     SizedBox(height: 16.v),
//                     _buildMasterDropdown3(),
//                     SizedBox(height: 16.v),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "lbl_phone_number".tr,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                     ),
//                     SizedBox(height: 5.v),
//                     phoneNumberField(
//                         eventLocationController.phoneNumberController, (p0) {
//                       if (p0 == null || p0.isEmpty) {
//                         return "Enter valid number";
//                       }
//                       return null;
//                     }),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildHeader() {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 18.v,
//         bottom: 19.v,
//       ),
//       decoration: AppDecoration.outlineGray10001,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(height: 5.v),
//           CustomAppBar(
//             leadingWidth: 44.h,
//             leading: AppbarLeadingImage(
//               onTap: () {
//                 Get.back();
//               },
//               imagePath: ImageConstant.imgIcArrowLeft,
//               margin: EdgeInsets.only(
//                 left: 20.h,
//                 top: 5.v,
//                 bottom: 2.v,
//               ),
//             ),
//             centerTitle: true,
//             title: AppbarSubtitle(
//               text: "lbl_event_location".tr,
//             ),
//             actions: [
//               AppbarSubtitleTwo(
//                 text: "2/2",
//                 margin: EdgeInsets.fromLTRB(16.h, 4.v, 16.h, 3.v),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildAddress() {
//     return CustomTextFormField(
//       controller: eventLocationController.addressController,
//       hintText: "Enter Address",
//       enableBorder: false,
//     );
//   }

//   /// Section Widget
//   Widget _buildMasterUsername1() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "lbl_address_line_1".tr,
//           style: theme.textTheme.bodyLarge,
//         ),
//         SizedBox(height: 8.v),
//         _buildAddress(),
//       ],
//     );
//   }

//   /// Section Widget
//   Widget _buildAddress1() {
//     return CustomTextFormField(
//       controller: eventLocationController.addressController1,
//       hintText: "Enter Address",
//       enableBorder: false,
//     );
//   }

//   /// Section Widget
//   Widget _buildMasterUsername2() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "lbl_address_line_2".tr,
//           style: theme.textTheme.bodyLarge,
//         ),
//         SizedBox(height: 8.v),
//         _buildAddress1(),
//       ],
//     );
//   }

//   /// Section Widget
//   Widget _buildCity() {
//     return Container(
//       height: 54.v,
//       padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 11.v),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(12.h)),
//       child: DropdownButton(
//         borderRadius: BorderRadius.circular(12.h),
//         dropdownColor: Colors.white,
//         elevation: 0,
//         underline: SizedBox(),
//         style: theme.textTheme.bodyLarge,
//         icon: CustomImageView(
//             imagePath: ImageConstant.imgRightIcon,
//             height: 20.adaptSize,
//             width: 20.adaptSize),
//         hint: Text(
//           "$selectCity",
//           style: theme.textTheme.bodyLarge,
//           textAlign: TextAlign.left,
//         ),
//         isExpanded: true,
//         items: city
//             .map((e) => DropdownMenuItem(
//                   child: Text(e),
//                   value: e,
//                 ))
//             .toList(),
//         onChanged: (value) {
//           selectCity = value as String;
//           setState(() {});
//         },
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildMasterDropdown1() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "lbl_city".tr,
//           style: theme.textTheme.bodyLarge,
//         ),
//         SizedBox(height: 5.v),
//         _buildCity(),
//       ],
//     );
//   }

//   /// Section Widget
//   Widget _buildInputBox() {
//     return Container(
//       height: 54.v,
//       padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 11.v),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(12.h)),
//       child: DropdownButton(
//         borderRadius: BorderRadius.circular(12.h),
//         dropdownColor: Colors.white,
//         elevation: 0,
//         underline: SizedBox(),
//         style: theme.textTheme.bodyLarge,
//         icon: CustomImageView(
//             imagePath: ImageConstant.imgRightIcon,
//             height: 20.adaptSize,
//             width: 20.adaptSize),
//         hint: Text(
//           "$selectState",
//           style: theme.textTheme.bodyLarge,
//           textAlign: TextAlign.left,
//         ),
//         isExpanded: true,
//         items: state
//             .map((e) => DropdownMenuItem(
//                   child: Text(e),
//                   value: e,
//                 ))
//             .toList(),
//         onChanged: (value) {
//           selectState = value as String;
//           setState(() {});
//         },
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildMasterDropdown2() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "lbl_state".tr,
//           style: theme.textTheme.bodyLarge,
//         ),
//         SizedBox(height: 5.v),
//         _buildInputBox(),
//       ],
//     );
//   }

//   /// Section Widget
//   Widget _buildCountry() {
//     return Container(
//       height: 54.v,
//       padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 11.v),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(12.h)),
//       child: DropdownButton(
//         borderRadius: BorderRadius.circular(12.h),
//         dropdownColor: Colors.white,
//         elevation: 0,
//         underline: SizedBox(),
//         style: theme.textTheme.bodyLarge,
//         icon: CustomImageView(
//             imagePath: ImageConstant.imgRightIcon,
//             height: 20.adaptSize,
//             width: 20.adaptSize),
//         hint: Text(
//           "$selectCountry",
//           style: theme.textTheme.bodyLarge,
//           textAlign: TextAlign.left,
//         ),
//         isExpanded: true,
//         items: country
//             .map((e) => DropdownMenuItem(
//                   child: Text(e),
//                   value: e,
//                 ))
//             .toList(),
//         onChanged: (value) {
//           selectCountry = value as String;
//           setState(() {});
//         },
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildMasterDropdown3() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "lbl_country".tr,
//           style: theme.textTheme.bodyLarge,
//         ),
//         SizedBox(height: 5.v),
//         _buildCountry(),
//       ],
//     );
//   }

//   /// Section Widget

//   /// Section Widget
//   Widget _buildSubmit() {
//     return CustomElevatedButton(
//         text: "lbl_submit".tr,
//         onPressed: () {
//           onTapSubmit();
//         });
//   }

//   /// Section Widget
//   Widget _buildBtnAndBg() {
//     return Container(
//       height: 112.v,
//       padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 40.v),
//       decoration: AppDecoration.white,
//       child: _buildSubmit(),
//     );
//   }

//   onTapSubmit() {
//     Get.dialog(AlertDialog(
//       backgroundColor: Colors.transparent,
//       contentPadding: EdgeInsets.zero,
//       insetPadding: const EdgeInsets.only(left: 0),
//       content: PropertyAddSuccessDialog(
//         Get.put(
//           PropertyAddSuccessController(),
//         ),
//       ),
//     ));
//   }
// }
