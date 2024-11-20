import 'package:uptm_secure_stay/presentation/my_property_screen/models/bedroomlist_item_model.dart';

import '../controller/my_property_controller.dart';
import '../models/bedroomlistItem_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

class BedroomlistItemWidget extends StatelessWidget {
  final BedroomlistItemModel bedroomlistItemModelObj;

  BedroomlistItemWidget(this.bedroomlistItemModelObj, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.propertyDetailsScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.v, horizontal: 12.h),
        decoration: AppDecoration.white.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: bedroomlistItemModelObj.imageUrls.isNotEmpty
                  ? bedroomlistItemModelObj.imageUrls[0]
                  : 'default_image_path', // Add a default path if needed
              height: 100.adaptSize,
              width: 100.adaptSize,
              radius: BorderRadius.circular(12.h),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bedroomlistItemModelObj.title,
                                maxLines: 1, // Restrict to one line
                                overflow: TextOverflow
                                    .ellipsis, // Truncate text with ellipsis
                                style: theme.textTheme.titleMedium,
                              ),
                              SizedBox(height: 8.v),
                              Text(
                                "RM${bedroomlistItemModelObj.monthlyRent}/mo",
                                style: theme.textTheme.bodyMedium,
                              ),
                              SizedBox(height: 8.v),
                              Text(
                                "Deposit: RM${bedroomlistItemModelObj.deposit}",
                                style: theme.textTheme.bodySmall,
                              ),
                              SizedBox(height: 8.v),
                              Text(
                                "Available from: ${bedroomlistItemModelObj.availableDate}",
                                style: theme.textTheme.bodySmall,
                              ),
                              SizedBox(height: 8.v),
                              Text(
                                "Minimum stay: ${bedroomlistItemModelObj.minimumStay} months",
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 35.v),
                        child: CustomIconButton(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.all(4.h),
                          decoration: IconButtonStyleHelper.outlineBlackTL121,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLike,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.bed,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 4.v,
                          bottom: 3.v,
                        ),
                        child: Text(
                          "${bedroomlistItemModelObj.beds} Beds",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.bathtub,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          margin: EdgeInsets.only(left: 13.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 4.v,
                          bottom: 3.v,
                        ),
                        child: Text(
                          "${bedroomlistItemModelObj.baths} Baths",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgIcSquarefeetGray900,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(left: 12.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 4.v,
                          bottom: 3.v,
                        ),
                        child: Text(
                          "${bedroomlistItemModelObj.sqft} sqft",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
