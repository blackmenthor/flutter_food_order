import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';

class AppTextTheme {
  static const _masterTextStyle = TextStyle(
    fontFamily: 'Abel',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    color: ThemeColors.textColor,
  );
  static final _bodyText = _masterTextStyle.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  );
  static final _smallText = _masterTextStyle.copyWith(
    fontSize: 11.0,
    fontWeight: FontWeight.normal,
  );
  static final _largeText = _masterTextStyle.copyWith(
    fontSize: 30.0,
    fontWeight: FontWeight.normal,
  );
  static final _titleLargeText = _masterTextStyle.copyWith(
    fontSize: 54.0,
    fontWeight: FontWeight.normal,
  );

  static get ayoMaemTextTheme => TextTheme(
    displayLarge: _largeText,
    displayMedium: _bodyText,
    displaySmall: _smallText,
    headlineLarge: _largeText,
    headlineMedium: _bodyText,
    headlineSmall: _smallText,
    titleLarge: _titleLargeText,
    titleMedium: _bodyText,
    titleSmall: _smallText,
    bodyLarge: _largeText,
    bodyMedium: _bodyText,
    bodySmall: _smallText,
    labelLarge: _largeText,
    labelMedium: _bodyText,
    labelSmall: _smallText,
  );
}