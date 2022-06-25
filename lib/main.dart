import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_food_order/app/app.dart';
import 'package:flutter_food_order/core/dependency_injection/injector.dart';
import 'package:flutter_food_order/core/models/auth_model.dart';
import 'package:flutter_food_order/core/models/booking_model.dart';
import 'package:flutter_food_order/core/models/location_model.dart';
import 'package:flutter_food_order/core/models/order_model.dart';
import 'package:flutter_food_order/core/models/restaurant_model.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // register firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    // Force disable Crashlytics collection while doing every day development.
    // Temporarily toggle this to true if you want to test crash reporting in your app.
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(false);
  }

  // register all dependencies
  await DependencyInjection.inject();

  FlutterNativeSplash.remove();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthModel()),
        ChangeNotifierProvider.value(value: LocationModel()),
        ChangeNotifierProvider.value(value: RestaurantModel()),
        ChangeNotifierProvider.value(value: BookingModel()),
        ChangeNotifierProvider.value(value: OrderModel()),
      ],
      child: const AyoMaemApp(),
  ));
}
