import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/controller/kickoff_controller.dart';
import 'package:flutter_food_order/core/dependency_injection/injector.dart';
import 'package:flutter_food_order/ui/pages/onboarding/onboarding_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/theme/text_theme.dart';

class AyoMaemApp extends StatefulWidget {
  const AyoMaemApp({
    Key? key,
  }) : super(key: key);

  @override
  State<AyoMaemApp> createState() => _AyoMaemAppState();
}

class _AyoMaemAppState extends State<AyoMaemApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final kickOffController = DependencyInjection
      .getDependency<KickOffController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (navigatorKey.currentContext != null) {
        await kickOffController.kickOff(navigatorKey.currentContext!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AyoMaem',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: ThemeColors.orangeColorSwatch,
        colorScheme: ThemeColors.colorScheme,
        buttonTheme: ThemeColors.buttonTheme,
        textTheme: AppTextTheme.ayoMaemTextTheme,
      ),
      home: const OnboardingPage(),
    );
  }
}