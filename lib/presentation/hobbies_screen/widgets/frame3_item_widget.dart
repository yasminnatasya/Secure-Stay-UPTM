// import '../models/frame3_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uptm_secure_stay/core/app_export.dart';
//
// // ignore: must_be_immutable
// class Frame3ItemWidget extends StatelessWidget {
//   Frame3ItemWidget(
//     this.frame3ItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   Frame3ItemModel frame3ItemModelObj;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => RawChip(
//         padding: EdgeInsets.symmetric(
//           horizontal: 12.h,
//           vertical: 10.v,
//         ),
//         showCheckmark: false,
//         labelPadding: EdgeInsets.zero,
//         label: Text(
//           frame3ItemModelObj.tag!.value,
//           style: TextStyle(
//             color: (frame3ItemModelObj.isSelected?.value ?? false)
//                 ? appTheme.gray900
//                 : appTheme.gray800,
//             fontSize: 16.fSize,
//             fontFamily: 'Neutrif Pro',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         selected: (frame3ItemModelObj.isSelected?.value ?? false),
//         backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
//         selectedColor: theme.colorScheme.primary,
//         shape: (frame3ItemModelObj.isSelected?.value ?? false)
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
//           frame3ItemModelObj.isSelected!.value = value;
//         },
//       ),
//     );
//   }
// }
