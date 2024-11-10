import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray800,
      );
  static get bodyLargeGray80016 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.gray800,
    fontSize: 16.fSize,
    height: 1.5.v

  );
  static get bodyLargeGray80018 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray800,
        fontSize: 18.fSize,
      );
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyLargeRedA200 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.redA200,
      );
  static get bodyLargeSFProDisplay => theme.textTheme.bodyLarge!.sFProDisplay;

  static get bodyLargeSFProDisplayRed700 =>
      theme.textTheme.bodyLarge!.sFProDisplay.copyWith(
        color: appTheme.red700,
      );
  static get bodyLargeSFProDisplay_1 => theme.textTheme.bodyLarge!.sFProDisplay;
  static get bodyLargeSFProDisplay_2 => theme.textTheme.bodyLarge!.sFProDisplay;
  static get bodyMediumGray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray800,
      );
  static get bodyMediumGray80013 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray800,
        fontSize: 13.fSize,
      );
  static get bodyMediumGreenA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.greenA700,
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 13.fSize,
      );
  static get bodyMediumSFProDisplayGray800 =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: appTheme.gray800,
        fontSize: 13.fSize,
      );
  static get bodyMediumSFProDisplayPrimaryContainer =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 13.fSize,
      );
  static get bodySmallGray800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray800,
        fontSize: 12.fSize,
      );
  static get bodySmallGray80012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray800,
        fontSize: 12.fSize,
      );
  // Headline text style
  static get headlineMediumOnPrimaryContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  // Title text style
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeSFProDisplay => theme.textTheme.titleLarge!.sFProDisplay;
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
      );
  static get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleMediumRedA200 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA200,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumRedA200Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA200,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumRedA200_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA200,
      );
  static get titleMediumSFProDisplay =>
      theme.textTheme.titleMedium!.sFProDisplay.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumSFProDisplay16 =>
      theme.textTheme.titleMedium!.sFProDisplay.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumSFProDisplayGray800 =>
      theme.textTheme.titleMedium!.sFProDisplay.copyWith(
        color: appTheme.gray800,
      );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
}

extension on TextStyle {
  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }

  // TextStyle get neutrifPro {
  //   return copyWith(
  //     fontFamily: 'Neutrif Pro',
  //   );
  // }
}
