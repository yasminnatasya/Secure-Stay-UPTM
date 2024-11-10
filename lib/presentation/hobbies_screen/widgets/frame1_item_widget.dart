// import '../models/frame1_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
//
// // ignore: must_be_immutable
// class Frame1ItemWidget extends StatelessWidget {
//   Frame1ItemWidget(
//     this.frame1ItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   Frame1ItemModel frame1ItemModelObj;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => RawChip(
//         padding: EdgeInsets.symmetric(
//           horizontal: 12.h,
//           vertical: 9.v,
//         ),
//         showCheckmark: false,
//         labelPadding: EdgeInsets.zero,
//         label: Text(
//           frame1ItemModelObj.tag!.value,
//           style: TextStyle(
//             color: (frame1ItemModelObj.isSelected?.value ?? false)
//                 ? appTheme.gray900
//                 : appTheme.gray800,
//             fontSize: 16.fSize,
//             fontFamily: 'Neutrif Pro',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         selected: (frame1ItemModelObj.isSelected?.value ?? false),
//         backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
//         selectedColor: theme.colorScheme.primary,
//         shape: (frame1ItemModelObj.isSelected?.value ?? false)
//             ? RoundedRectangleBorder(
//                 side: BorderSide.none,
//                 borderRadius: BorderRadius.circular(
//                   6.h,
//                 ),
//               )
//             : RoundedRectangleBorder(
//                 side: BorderSide.none,
//                 borderRadius: BorderRadius.circular(
//                   6.h,
//                 ),
//               ),
//         onSelected: (value) {
//           frame1ItemModelObj.isSelected!.value = value;
//         },
//       ),
//     );
//   }
// }
