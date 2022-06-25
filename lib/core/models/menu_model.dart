import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/domain/%20models/menu.dart';

class MenuModel extends ChangeNotifier {
  MenuModel({
     required this.restaurantId,
  }) {
    fetchMenus();
  }

  final String restaurantId;

  List<Menu>? menus;

  bool get hasData => menus != null;

  FirebaseFirestore get instance => FirebaseFirestore.instance;

  Future<void> fetchMenus() async {
    final res = instance.collection('menus')
        .where('restaurantId', isEqualTo: restaurantId);
    res.snapshots().listen((data) {
      menus = data.docs.map((snapshot) => Menu(
        uid: snapshot.id,
        restaurantId: snapshot.data()['restaurantId'],
        name: snapshot.data()['name'],
        description: snapshot.data()['description'],
        rating: snapshot.data()['rating'],
        ratingCount: snapshot.data()['rating'],
        price: snapshot.data()['price'],
        image: snapshot.data()['image'],
      )).toList();
      notifyListeners();
    });
  }

}