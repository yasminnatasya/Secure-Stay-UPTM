import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.2),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.5),
      );
  static BoxDecoration get fillPrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlack => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withOpacity(0),
            appTheme.black900.withOpacity(0.65),
          ],
        ),
      );
  static BoxDecoration get gradientBlackToBlack900 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.54, -1.24),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withOpacity(0.4),
            appTheme.black900.withOpacity(0),
          ],
        ),
      );
  static BoxDecoration get gradientBlackToBlack9001 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.81),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withOpacity(0),
            appTheme.black900.withOpacity(0.63),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.03),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.08),
            spreadRadius: 2.h,
            blurRadius: 23.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.06),
            spreadRadius: 2.h,
            blurRadius: 15.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray10001 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray10001,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray300,
            width: 1.h,
          ),
        ),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get circleBorder60 => BorderRadius.circular(
        60.h,
      );
  static BorderRadius get circleBorder82 => BorderRadius.circular(
        82.h,
      );
  static BorderRadius get circleBorder9 => BorderRadius.circular(
        9.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL12 => BorderRadius.vertical(
        bottom: Radius.circular(12.h),
      );
  static BorderRadius get customBorderBL16 => BorderRadius.vertical(
        bottom: Radius.circular(16.h),
      );
  static BorderRadius get customBorderTL12 => BorderRadius.vertical(
        top: Radius.circular(12.h),
      );
  static BorderRadius get customBorderTL121 => BorderRadius.only(
        topLeft: Radius.circular(12.h),
        bottomRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(12.h),
      );

  static BorderRadius get customBorderTR121 => BorderRadius.only(
        topRight: Radius.circular(12.h),
        bottomRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(12.h),
      );
  static BorderRadius get customBorderTL32 => BorderRadius.vertical(
        top: Radius.circular(32.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    