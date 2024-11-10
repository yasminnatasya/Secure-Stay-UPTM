// import '../controller/populr_property_controller.dart';
// import '../models/propertygrid_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
// import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';
//
// // ignore: must_be_immutable
// class PropertygridItemWidget extends StatelessWidget {
//   PropertygridItemWidget(
//     this.propertygridItemModelObj, {
//     Key? key,
//     this.onTapProperty,
//   }) : super(
//           key: key,
//         );
//
//   PropertygridItemModel propertygridItemModelObj;
//
//   var controller = Get.find<PopulrPropertyController>();
//
//   VoidCallback? onTapProperty;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTapProperty!.call();
//       },
//       child: Container(
//         padding: EdgeInsets.all(8.h),
//         decoration: AppDecoration.white.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder12,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 116.v,
//               width: 174.h,
//               child: Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   Obx(
//                     () => CustomImageView(
//                       imagePath: propertygridItemModelObj.image!.value,
//                       height: 116.v,
//                       width: 174.h,
//                       radius: BorderRadius.circular(
//                         12.h,
//                       ),
//                       alignment: Alignment.center,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 8.v,
//                       right: 8.h,
//                     ),
//                     child: CustomIconButton(
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                       padding: EdgeInsets.all(4.h),
//                       alignment: Alignment.topRight,
//                       child: CustomImageView(
//                         imagePath: ImageConstant.imgLike,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 9.v),
//             Obx(
//               () => Text(
//                 propertygridItemModelObj.shermanOaks!.value,
//                 style: CustomTextStyles.titleMediumBold16,
//               ),
//             ),
//             SizedBox(height: 8.v),
//             Row(
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgIcLocationGray800,
//                   height: 14.adaptSize,
//                   width: 14.adaptSize,
//                   margin: EdgeInsets.only(bottom: 1.v),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 4.h),
//                   child: Obx(
//                     () => Text(
//                       propertygridItemModelObj.washington!.value,
//                       style: CustomTextStyles.bodySmallGray800,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10.v),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "lbl_400".tr,
//                     style: theme.textTheme.titleSmall,
//                   ),
//                   TextSpan(
//                     text: "lbl_entry".tr,
//                     style: CustomTextStyles.bodySmallGray80012,
//                   ),
//                 ],
//               ),
//               textAlign: TextAlign.left,
//             ),
//             SizedBox(height: 4.v),
//           ],
//         ),
//       ),
//     );
//   }
// }
