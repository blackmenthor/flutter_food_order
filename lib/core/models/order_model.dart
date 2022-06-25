import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/domain/%20models/order.dart';

class OrderModel extends ChangeNotifier {

  List<Order>? orders;

  FirebaseFirestore get instance => FirebaseFirestore.instance;

  bool get hasData => orders != null;

  Future<void> fetchOrdersForUser({
    required String userId,
  }) async {
    final res = instance.collection('orders').where('userId', isEqualTo: userId);
    res.snapshots().listen((data) {
      orders = data.docs.map((snapshot) {
        return Order(
          uid: snapshot.id,
          userId: snapshot.data()['userId'],
          restaurantId: snapshot.data()['restaurantId'],
          delivery: snapshot.data()['delivery'] == null
              ? 0.0
              : snapshot.data()['delivery'] * 1.0,
          subtotal: snapshot.data()['subtotal'],
          taxFees: snapshot.data()['taxFees'],
          total: snapshot.data()['total'],
        );
      }).toList();
      notifyListeners();
    });
  }
  
}