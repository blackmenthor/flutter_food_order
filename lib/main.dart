import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_food_order/app/app.dart';
import 'package:flutter_food_order/core/dependency_injection/injector.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // register firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // register all dependencies
  await DependencyInjection.inject();

  await Future.delayed(const Duration(milliseconds: 1500), () {});
  FlutterNativeSplash.remove();
  runApp(const AyoMaemApp());
}
