import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class ChatslistItemWidget extends StatelessWidget {
  String robertfox;

  String robertFox;

  String awesome;

  String time;
  ChatslistItemWidget({
    Key? key,
    required this.robertfox,
    required this.robertFox,
    required this.awesome,
    required this.time,
  }) : super(
          key: key,
        );

  //ChatslistItemModel chatslistItemModelObj;

  // var controller = Get.find<Chats1Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: robertfox,
            height: 58.adaptSize,
            width: 58.adaptSize,
            radius: BorderRadius.circular(
              29.h,
            ),
            margin: EdgeInsets.only(bottom: 2.v),
          ),
          SizedBox(
            width: 16.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  robertFox,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 13.v),
                Text(
                  awesome,
                  style: CustomTextStyles.bodyLargeGray800,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 37.v,
              bottom: 1.v,
            ),
            child: Text(
              time,
              style: CustomTextStyles.bodyLargeGray800,
            ),
          ),
        ],
      ),
    );
  }
}
