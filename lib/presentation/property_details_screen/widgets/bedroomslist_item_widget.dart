import 'package:uptm_secure_stay/widgets/custom_icon_button.dart';

import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

// ignore: must_be_immutable
class FacilitiesViewAll extends StatelessWidget {
  final Map<String, dynamic> propertyData;

  FacilitiesViewAll({Key? key, required this.propertyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      height: 353.v,
      width: double.maxFinite,
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL32,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 36.v, bottom: 16.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Facilities', style: theme.textTheme.titleMedium),
                  ],
                ),
              ),
              Divider(
                color: appTheme.black20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.h, 24.v, 16.h, 40.v),
                child: Wrap(
                  spacing: 16.h,
                  runSpacing: 16.v,
                  children: [
                    if (propertyData['wifi'] == true)
                      _buildFurniture(
                          image: ImageConstant.wifi1, userLabel: "Wifi"),
                    if (propertyData['furniture'] == true)
                      _buildFurniture(
                          image: ImageConstant.furniture1,
                          userLabel: "Furniture"),
                    if (propertyData['elevator'] == true)
                      _buildFurniture(
                          image: ImageConstant.elevator1,
                          userLabel: "Elevator"),
                    if (propertyData['students'] == true)
                      _buildFurniture(
                          image: ImageConstant.students1,
                          userLabel: "Students"),
                    if (propertyData['vegetarian'] == true)
                      _buildFurniture(
                          image: ImageConstant.vegan1, userLabel: "Vegetarian"),
                    if (propertyData['male'] == true)
                      _buildFurniture(
                          image: ImageConstant.male1, userLabel: "Male"),
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
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFurniture({required String userLabel, required String image}) {
    return Column(
      children: [
        CustomIconButton(
          height: 68.adaptSize,
          width: 68.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: IconButtonStyleHelper.fillOnPrimaryContainerTL34.copyWith(
            color: Color(0xFFF6F5F8),
          ),
          child: CustomImageView(imagePath: image),
        ),
        SizedBox(height: 8.v),
        Text(userLabel,
            style:
                theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray900)),
      ],
    );
  }
}
