import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/domain/%20models/restaurant.dart';

class RestaurantModel extends ChangeNotifier {

  List<Restaurant>? restaurants;

  bool get hasData => restaurants != null;

  RestaurantModel() {
    fetchRestaurants();
  }

  FirebaseFirestore get instance => FirebaseFirestore.instance;

  Future<void> fetchRestaurants() async {
    final res = instance.collection('restaurants');
    final data = await res.get();
    restaurants = data.docs.map((snapshot) => Restaurant(
        uid: snapshot.id,
        name: snapshot.data()['name'],
        rating: snapshot.data()['rating'],
        ratingCount: snapshot.data()['rating'],
        category: snapshot.data()['category'],
        isFreeDelivery: snapshot.data()['isFreeDelivery'],
        image: snapshot.data()['image'],
    )).toList();
    notifyListeners();
  }

}