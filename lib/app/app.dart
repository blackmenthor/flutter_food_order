import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/pages/home/home_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/theme/text_theme.dart';

class AyoMaemApp extends StatelessWidget {
  const AyoMaemApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AyoMaem',
      theme: ThemeData(
        primarySwatch: ThemeColors.orangeColorSwatch,
        colorScheme: ThemeColors.colorScheme,
        buttonTheme: ThemeColors.buttonTheme,
        textTheme: AppTextTheme.ayoMaemTextTheme,
      ),
      home: const HomePage(),
    );
  }
}