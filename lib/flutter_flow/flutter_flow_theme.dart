// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color otherBackground;
  late Color purple;
  late Color electro;
  late Color orange;
  late Color stroke;
  late Color black;
  late Color logo;
  late Color white;
  late Color shadow;
  late Color table;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF007BBF);
  late Color secondary = const Color(0xFF34D1BF);
  late Color tertiary = const Color(0xFFFF715B);
  late Color alternate = const Color(0xFFDE0D92);
  late Color primaryText = const Color(0xFF414D55);
  late Color secondaryText = const Color(0xFF90A1AC);
  late Color primaryBackground = const Color(0xFFF1F5F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF636D73);
  late Color accent2 = const Color(0xFFCCCCCC);
  late Color accent3 = const Color(0xFFE4EAF0);
  late Color accent4 = const Color(0xFFDEEEFF);
  late Color success = const Color(0xFF7ED321);
  late Color warning = const Color(0xFFFDCA40);
  late Color error = const Color(0xFFED0423);
  late Color info = const Color(0xFF2662F0);

  late Color otherBackground = Color(0xFFFAFBFD);
  late Color purple = Color(0xFF6665DD);
  late Color electro = Color(0xFF29E7CD);
  late Color orange = Color(0xFFF17105);
  late Color stroke = Color(0xFFA2C0D4);
  late Color black = Color(0xFF000000);
  late Color logo = Color(0xFF007BBF);
  late Color white = Color(0xFFFFFFFF);
  late Color shadow = Color(0x1A142E6E);
  late Color table = Color(0xFFF1F4F8);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Rubik';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Rubik';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 48.0,
      );
  String get displaySmallFamily => 'Rubik';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 48.0,
      );
  String get headlineLargeFamily => 'Rubik';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 40.0,
      );
  String get headlineMediumFamily => 'Rubik';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 33.0,
      );
  String get headlineSmallFamily => 'Rubik';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );
  String get titleLargeFamily => 'Rubik';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 23.0,
      );
  String get titleMediumFamily => 'Rubik';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 19.0,
      );
  String get titleSmallFamily => 'Rubik';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Rubik';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get labelMediumFamily => 'Rubik';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
  String get labelSmallFamily => 'Rubik';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Rubik',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 8.0,
      );
  String get bodyLargeFamily => 'Roboto';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Roboto';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodySmallFamily => 'Roboto';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF007BBF);
  late Color secondary = const Color(0xFF34D1BF);
  late Color tertiary = const Color(0xFFFF715B);
  late Color alternate = const Color(0xFFDE0D92);
  late Color primaryText = const Color(0xFF9EA7AC);
  late Color secondaryText = const Color(0xFFFAFBFD);
  late Color primaryBackground = const Color(0xFF000000);
  late Color secondaryBackground = const Color(0xFF171819);
  late Color accent1 = const Color(0xFF636D73);
  late Color accent2 = const Color(0xFFCCCCCC);
  late Color accent3 = const Color(0xFF414D55);
  late Color accent4 = const Color(0xFF090A0A);
  late Color success = const Color(0xFF7ED321);
  late Color warning = const Color(0xFFFDCA40);
  late Color error = const Color(0xFFED0423);
  late Color info = const Color(0xFF2662F0);

  late Color otherBackground = Color(0xFF131414);
  late Color purple = Color(0xFF6665DD);
  late Color electro = Color(0xFF29E7CD);
  late Color orange = Color(0xFFF17105);
  late Color stroke = Color(0xFF42474B);
  late Color black = Color(0xFF000000);
  late Color logo = Color(0xFF007BBF);
  late Color white = Color(0xFFFFFFFF);
  late Color shadow = Color(0x1A142E6E);
  late Color table = Color(0xFF414D55);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
