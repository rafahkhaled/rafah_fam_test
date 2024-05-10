import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
      );
// Label text style
  static get labelLargeGray10001SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray10001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeMedium_1 => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelSmallBluegray80001 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blueGray80001,
      );
  static get labelSmallBold => theme.textTheme.labelSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelSmallGray10001 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray10001,
      );
// Title text style
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
}
