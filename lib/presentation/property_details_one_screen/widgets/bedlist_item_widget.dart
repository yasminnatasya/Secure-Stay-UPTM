// import '../controller/property_details_one_controller.dart';
// import '../models/bedlist_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
//
// // ignore: must_be_immutable
// class BedlistItemWidget extends StatelessWidget {
//   BedlistItemWidget(
//    {
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   // BedlistItemModel bedlistItemModelObj;
//
//   var controller = Get.find<PropertyDetailsOneController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 133.h,
//       child: Align(
//         alignment: Alignment.center,
//         child: Container(
//           padding: EdgeInsets.all(12.h),
//           decoration: AppDecoration.white.copyWith(
//             borderRadius: BorderRadiusStyle.roundedBorder12,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(
//                 () => CustomImageView(
//                   imagePath: bedlistItemModelObj.nov!.value,
//                   height: 26.adaptSize,
//                   width: 26.adaptSize,
//                 ),
//               ),
//               SizedBox(height: 17.v),
//               Obx(
//                 () => Text(
//                   bedlistItemModelObj.nov1!.value,
//                   style: CustomTextStyles.titleMediumBold16,
//                 ),
//               ),
//               SizedBox(height: 3.v),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
