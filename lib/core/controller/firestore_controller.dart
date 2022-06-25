import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food_order/core/domain/%20models/user.dart';

class FirestoreController {

  FirebaseFirestore get instance => FirebaseFirestore.instance;

  Future<void> createUserProfile({
    required String uid,
    required String email,
    required String name,
  }) async {
    final users = instance.collection('users');
    await users.doc(uid).set({
      'email': email,
      'name': name,
    });
  }

  Future<void> setUserProfile({
    required String uid,
    String? email,
    String? name,
  }) async {
    final users = instance.collection('users');
    if (email != null && email.isNotEmpty) {
      await users.doc(uid).update({
        'email': email,
      });
    }
    if (name != null && name.isNotEmpty) {
      await users.doc(uid).update({
        'name': name,
      });
    }
  }

  Future<AyoMaemUser?> getUserProfile({
      required String uid,
  }) async {
    final users = instance.collection('users');
    final user = await users.doc(uid).get();
    if (!user.exists) {
      return null;
    }
    final userData = user.data();
    return AyoMaemUser(
      uid: user.id,
      name: userData!['name'],
      email: userData!['email'],
    );
  }

}