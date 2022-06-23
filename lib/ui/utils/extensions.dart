import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';

extension ImagesStringExt on String {
  String toLocalAssetPath() {
    return 'res/images/$this';
  }
}

extension TextStyleExt on TextStyle {
  TextStyle get primary => copyWith(
    color: ThemeColors.orangeColor,
  );
  TextStyle get accent => copyWith(
    color: ThemeColors.yellowColor,
  );
  TextStyle get grey => copyWith(
    color: ThemeColors.greyColor,
  );
}

extension ContextExt on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  void push({required Widget Function(BuildContext) builder}) {
    Navigator.of(this).push(MaterialPageRoute(
        builder: builder,
    ));
  }

  void pushAndReplace({required Widget Function(BuildContext) builder}) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(
      builder: builder,
    ));
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void popUntilRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}