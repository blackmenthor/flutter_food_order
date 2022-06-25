import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/controller/shared_preferences_controller.dart';
import 'package:flutter_food_order/core/dependency_injection/injector.dart';
import 'package:flutter_food_order/ui/dialogs/loading_dialog.dart';
import 'package:flutter_food_order/ui/pages/home/home_page.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';

class KickOffController {

  final sharedPreferencesController = DependencyInjection
      .getDependency<SharedPreferencesController>();

  Future<bool> _checkIfOnboardingIsShown() async {
    final onboardingShown = await sharedPreferencesController
        .getBool(SharedPreferencesKeys.onBoardingShown) ?? false;
    return onboardingShown;
  }

  Future<void> kickOff(BuildContext context) async {
    showLoadingDialog(context: context);
    final onboardingShown = await _checkIfOnboardingIsShown();
    if (onboardingShown) {
      // if on boarding is already is shown, we should redirect user directly
      // to home page instead of showing them the login/register page
      context.pushAndReplace(builder: (ctx) => const HomePage());
      return;
    }

    // if onboarding is not shown yet, we change the shared preferences
    // value to true, so the onboarding won't be shown twice
    await sharedPreferencesController.setBool(SharedPreferencesKeys
        .onBoardingShown, true);

    context.pop();

    return;
  }

}