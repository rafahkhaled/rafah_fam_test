import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.comfortable,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodySmall: TextStyle(
          color: appTheme.blueGray600,
          fontSize: 12.fSize,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray80001,
          fontSize: 13.fSize,
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.blueGray80001,
          fontSize: 18.fSize,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.blueGray80001,
          fontSize: 14.fSize,
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Colors.white,
    secondaryContainer: Color(0XFFFA712D),
    onPrimaryContainer: Color(0XFFFFC42C),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => Color(0XFF000000);

// BlueGray
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray600 => Color(0XFF53577A);
  Color get blueGray80001 => Color(0XFF242B5C);
// BlueGrayAf
  Color get bluecolor => Colors.blueAccent;
  Color get blueGray700Af => Color(0XAF3F467C);
// DeepOrange
  Color get deepOrange400 => Color(0XFFFD7F49);
// Gray
  Color get gray10001 => Color(0XFFD3D3D3);
// Orange
  Color get orange300 => Color(0XFFFDB549);
  Color get orange30001 => Color(0XFFF2B848);
// Red
  Color get redA200 => Color(0XFFFD5F49);
// White
  Color get whiteA700 => Color(0XFFFFFFFF);
}
