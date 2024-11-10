import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class FacilitiesViewAll extends StatelessWidget {
  FacilitiesViewAll({
    Key? key,
  }) : super(
          key: key,
        );

  //BedroomslistItemModel bedroomslistItemModelObj;

  //var controller = Get.find<PropertyDetailsController>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      height: 353.v,
      width: double.maxFinite,
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL32,
      ),
      child: Stack(children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 36.v, bottom: 16.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Facilities', style: theme.textTheme.titleMedium),
                  ],
                )),
            Divider(
              color: appTheme.black20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.h, 24.v, 16.h, 40.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _buildFurniture(
                          image: ImageConstant.wifi1, userLabel: "Wifi"),
                      SizedBox(
                        height: 16.v,
                      ),
                      _buildFurniture(
                          image: ImageConstant.vegan1, userLabel: "Vegitirian"),
                    ],
                  ),
                  Column(
                    children: [
                      _buildFurniture(
                          image: ImageConstant.furniture1,
                          userLabel: "Furniture"),
                      SizedBox(
                        height: 16.v,
                      ),
                      _buildFurniture(
                          image: ImageConstant.male1, userLabel: "Male"),
                    ],
                  ),
                  Column(
                    children: [
                      _buildFurniture(
                          image: ImageConstant.elevator1,
                          userLabel: "Elevator"),
                      SizedBox(
                        height: 16.v,
                      ),
                      _buildFurniture(
                          image: ImageConstant.singer1, userLabel: "Singer"),
                    ],
                  ),
                  Column(
                    children: [
                      _buildFurniture(
                          image: ImageConstant.students1,
                          userLabel: "Students"),
                      SizedBox(
                        height: 16.v,
                      ),
                      _buildFurniture(
                          image: ImageConstant.football1,
                          userLabel: "Football"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 16.v,
          right: 16.h,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 36,
              height: 36,
              padding: EdgeInsets.all(7.h),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgIcClose,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  /// Common widget
  Widget _buildFurniture({required String userLabel, required String image}) {
    return Column(children: [
      CustomIconButton(
          height: 68.adaptSize,
          width: 68.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillOnPrimaryContainerTL34.copyWith(
            color: Color(0xFFF6F5F8),
          ),
          child: CustomImageView(imagePath: image)),
      SizedBox(height: 8.v),
      Text(userLabel,
          style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray900))
    ]);
  }
}
