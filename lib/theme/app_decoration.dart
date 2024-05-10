import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGrayAf => BoxDecoration(
        color: appTheme.blueGray700Af,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10001,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
// Gradient decorations
  static BoxDecoration get gradientDeepOrangeToOrange => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -0.16),
          end: Alignment(0.83, 1),
          colors: [appTheme.deepOrange400, appTheme.orange30001],
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder35 => BorderRadius.circular(
        35.h,
      );
// Custom borders
  static BorderRadius get customBorderLR25 => BorderRadius.only(
        topRight: Radius.circular(25.h),
      );
// Rounded borders
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder18 => BorderRadius.circular(
        18.h,
      );
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}
