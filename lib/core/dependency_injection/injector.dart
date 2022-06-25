import 'package:flutter_food_order/core/controller/firestore_controller.dart';
import 'package:flutter_food_order/core/controller/kickoff_controller.dart';
import 'package:flutter_food_order/core/controller/shared_preferences_controller.dart';
import 'package:injector/injector.dart';

class DependencyInjection {

  static Injector injector = Injector();

  static Future<Injector> inject() async {
    injector.registerSingleton<SharedPreferencesController>(
            () => SharedPreferencesController());
    injector.registerSingleton<FirestoreController>(
            () => FirestoreController());
    injector.registerSingleton<KickOffController>(() => KickOffController());

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