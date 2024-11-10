// import '../models/chipview_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
//
// // ignore: must_be_immutable
// class ChipviewItemWidget extends StatelessWidget {
//   ChipviewItemWidget(
//     this.chipviewItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   ChipviewItemModel chipviewItemModelObj;
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
//           chipviewItemModelObj.tag!.value,
//           style: TextStyle(
//             color: (chipviewItemModelObj.isSelected?.value ?? false)
//                 ? appTheme.gray900
//                 : appTheme.gray800,
//             fontSize: 16.fSize,
//             fontFamily: 'Neutrif Pro',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         selected: (chipviewItemModelObj.isSelected?.value ?? false),
//         backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
//         selectedColor: theme.colorScheme.primary,
//         shape: (chipviewItemModelObj.isSelected?.value ?? false)
//             ? RoundedRectangleBorder(
//                 side: BorderSide(
//                   color: theme.colorScheme.primary,
//                   width: 1.h,
//                 ),
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
//           chipviewItemModelObj.isSelected!.value = value;
//         },
//       ),
//     );
//   }
// }
