import 'package:flutter_food_order/core/controller/api/auth_controller.dart';
import 'package:flutter_food_order/core/controller/api/booking_controller.dart';
import 'package:flutter_food_order/core/controller/api/food_controller.dart';
import 'package:flutter_food_order/core/controller/api/review_controller.dart';
import 'package:flutter_food_order/core/controller/kickoff_controller.dart';
import 'package:flutter_food_order/core/controller/shared_preferences_controller.dart';
import 'package:injector/injector.dart';

class DependencyInjection {

  static Injector injector = Injector();

  static Future<Injector> inject() async {
    injector.registerSingleton<SharedPreferencesController>(
            () => SharedPreferencesController());
    injector.registerSingleton<KickOffController>(() => KickOffController());
    injector.registerSingleton<AuthController>(() => AuthController());
    injector.registerSingleton<BookingController>(() => BookingController());
    injector.registerSingleton(() => FoodController());
    injector.registerSingleton(() => ReviewController());

    return injector;
  }

  static T getDependency<T>({
    String? dependencyName,
  }) {
    if (dependencyName == null) {
      return injector.get<T>();
    }
    return injector.get<T>(dependencyName: dependencyName);
  }

}