import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/theme/text_theme.dart';

class ThemeColors {

  // orange color swatch
  static const Color orangeColor = Color(0xFFFE724C);
  static const Color orangeColor80 = Color(0xFFFE8160);
  static const Color orangeColor50 = Color(0xFFFEA58D);
  static const Color orangeColor20 = Color(0xFFFED2C7);

  static MaterialColor orangeColorSwatch = MaterialColor(
      orangeColor.value,
      const {
        900: orangeColor,
        700: orangeColor,
        600: orangeColor,
        500: orangeColor,
        300: orangeColor,
        200: orangeColor,
        100: orangeColor,
        80: orangeColor80,
        50: orangeColor50,
        20: orangeColor50,
      },
  );

  // yellow color swatch
  static const Color yellowColor = Color(0xFFFFC529);
  static const Color yellowColor80 = Color(0xFFFFD050);
  static const Color yellowColor50 = Color(0xFFFFDF8B);
  static const Color yellowColor20 = Color(0xFFFFEFC3);

  static MaterialColor yellowColorSwatch = MaterialColor(
    yellowColor.value,
    const {
      900: yellowColor,
      700: yellowColor,
      600: yellowColor,
      500: yellowColor,
      300: yellowColor,
      200: yellowColor,
      100: yellowColor,
      80: yellowColor80,
      50: yellowColor50,
      20: yellowColor50,
    },
  );

  // grey color swatch
  static const Color greyColor = Color(0xFF9A9FAE);
  static const Color greyColor80 = Color(0xFFA8ACB9);
  static const Color greyColor50 = Color(0xFFC4C7D0);
  static const Color greyColor20 = Color(0xFFEBEBEB);

  // misc color swatch
  static const Color errorColor = Colors.red;
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color foregroundColor = Color(0xFFFFFFFF);
  static const Color gradientColor = Color(0xFF191B2F);

  static MaterialColor greyColorSwatch = MaterialColor(
    greyColor.value,
    const {
      900: greyColor,
      700: greyColor,
      600: greyColor,
      500: greyColor,
      300: greyColor,
      200: greyColor,
      100: greyColor,
      80: greyColor80,
      50: greyColor50,
      20: greyColor50,
    },
  );

  // text color swatch
  static const Color textColor = Color(0xFF1A1D26);
  static const Color textColor80 = Color(0xFF2A2F3D);
  static const Color textColor50 = Color(0xFF4D5364);
  static const Color textColor20 = Color(0xFF6E7489);

  static ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: orangeColorSwatch,
      primaryContainer: orangeColorSwatch,
      onPrimary: orangeColorSwatch,
      secondary: yellowColorSwatch,
      secondaryContainer: yellowColorSwatch,
      onSecondary: yellowColorSwatch,
      error: errorColor,
      onError: errorColor,
      background: backgroundColor,
      onBackground: backgroundColor,
      surface: foregroundColor,
      onSurface: foregroundColor,
  );

  static ButtonThemeData buttonTheme = ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    buttonColor: foregroundColor,
    colorScheme: colorScheme,
  );

}