import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/controller/firestore_controller.dart';
import 'package:flutter_food_order/core/dependency_injection/injector.dart';
import 'package:flutter_food_order/core/domain/%20models/user.dart';

class AuthModel extends ChangeNotifier {

  AyoMaemUser? user;

  bool get isLoggedIn => user != null;

  final firestoreController = DependencyInjection.getDependency<FirestoreController>();
  FirebaseAuth get instance => FirebaseAuth.instance;

  AuthModel() {
    init();
  }

  void init() {
    instance.authStateChanges().listen((event)
      => setUser(user: event?.toLocalUser));
  }

  Future<void> setUser({
    required AyoMaemUser? user,
  }) async {
    if (user == null) {
      this.user = null;
      return;
    }
    final userProfileFromFirestore = await firestoreController
        .getUserProfile(uid: user!.uid);
    this.user = userProfileFromFirestore;

    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    notifyListeners();
  }

  Future<void> logout() async {
    await instance.signOut();
    notifyListeners();
  }

  Future<void> setUserProfile({
    String? uid,
    String? email,
    String? name,
  }) async {
    uid ??= user?.uid;
    await firestoreController.setUserProfile(
        uid: uid!,
        email: email,
        name: name,
    );
    setUser(user: user?.copyWith(
      email: email,
      name: name,
    ));
    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String name,
    required String password,
  }) async {
    final resp = await instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (resp.user != null && resp.user!.uid != null) {
      final userId = resp.user?.uid;
      await firestoreController.createUserProfile(
        uid: userId!,
        email: email,
        name: name,
      );
    }
    await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    notifyListeners();
  }

}