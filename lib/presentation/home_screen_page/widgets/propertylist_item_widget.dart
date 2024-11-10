import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/utils/image_constant.dart';
import 'package:uptm_secure_stay/core/utils/size_utils.dart';
import 'package:uptm_secure_stay/theme/custom_text_style.dart';
import 'package:uptm_secure_stay/theme/theme_helper.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';
import 'package:uptm_secure_stay/widgets/custom_image_view.dart';

class RecommendedFormat extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? likeOnTap;

  final String image;
  final Widget likeImage; // Change to Widget type

  final String name;
  final String address;
  final String price;
  final String type;

  final String? bed;
  final String? bathtub;
  final int? id;

  const RecommendedFormat({
    super.key,
    this.onTap,
    this.likeOnTap,
    required this.likeImage, // Updated to be required
    required this.image,
    required this.name,
    required this.address,
    required this.price,
    required this.type,
    this.bed,
    this.bathtub,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(8.h, 8.v, 8.h, 12.v),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12.h)),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error, color: Colors.red, size: 80),
                            Text("Image not available"),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.v,
                      right: 8.h,
                    ),
                    child: GestureDetector(
                      onTap: likeOnTap,
                      child: CustomIconButton(
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        decoration: IconButtonStyleHelper.outlineBlack,
                        padding: EdgeInsets.all(4.h),
                        alignment: Alignment.topRight,
                        child: likeImage, // Use likeImage as a Widget
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgIcLocationGray800,
                        height: 14.adaptSize,
                        width: 14.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          address,
                          style: CustomTextStyles.bodySmallGray800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: price,
                              style: theme.textTheme.titleSmall,
                            ),
                            TextSpan(
                              text: type,
                              style: CustomTextStyles.bodySmallGray80012,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.bed,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                          ),
                          SizedBox(
                            width: 4.h,
                          ),
                          Text(bed ?? '-', style: theme.textTheme.bodySmall!),
                          CustomImageView(
                            imagePath: ImageConstant.bathtub,
                            height: 12.adaptSize,
                            width: 12.adaptSize,
                            margin: EdgeInsets.only(left: 8.h),
                          ),
                          SizedBox(
                            width: 4.h,
                          ),
                          Text(bathtub ?? '-',
                              style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
