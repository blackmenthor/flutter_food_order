import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/controller/firestore_controller.dart';
import 'package:flutter_food_order/core/dependency_injection/injector.dart';
import 'package:flutter_food_order/core/domain/%20models/menu.dart';
import 'package:flutter_food_order/core/domain/%20models/restaurant.dart';
import 'package:flutter_food_order/core/domain/%20models/user.dart';

class BookingModel extends ChangeNotifier {

  final FirestoreController firestoreController
    = DependencyInjection.getDependency<FirestoreController>();

  Map<Restaurant, Map<Menu, int>> cart = {};

  double total(Restaurant restaurant) {
    return delivery + taxAndFees(restaurant) + subtotalForRestaurant(restaurant);
  }

  // $10 static
  double get delivery => 10.0;

  double taxAndFees(Restaurant restaurant) {
    // 10 percent
    return subtotalForRestaurant(restaurant) * 0.1;
  }

  double subtotalForRestaurant(Restaurant restaurant) {
    final cart = cartForRestaurant(restaurant);
    var subtotal = 0.0;
    for (final item in cart!.keys) {
      final subtotalForItem = item.price! * cart[item]!;
      subtotal += subtotalForItem;
    }
    return subtotal;
  }

  Map<Menu, int>? cartForRestaurant(Restaurant restaurant) => cart[restaurant];

  int totalCartForRestaurant(Restaurant restaurant) {
    final cart = cartForRestaurant(restaurant);
    return cart?.values?.fold(0, (a, b) => a! + b) ?? 0;
  }

  int menuCount({
    required Restaurant restaurant,
    required Menu menu,
  }) {
    if (!cart.containsKey(restaurant)) {
      return 0;
    }
    final cartForRestaurant = cart[restaurant]!;
    if (!cartForRestaurant.containsKey(menu)) {
      return 0;
    }
    return cartForRestaurant[menu]!;
  }

  void decreaseMenuFromCart({
    required Restaurant restaurant,
    required Menu menu,
  }) {
    if (cart.containsKey(restaurant)) {
      final cartForRestaurant = cart[restaurant]!;
      if (cartForRestaurant.containsKey(menu)) {
        final endResult = cartForRestaurant[menu]! - 1;
        if (endResult == 0) {
          cartForRestaurant.remove(menu);
        } else {
          cartForRestaurant[menu] = endResult;
        }
      }
    }
    notifyListeners();
  }

  void clearMenuFromCart({
    required Restaurant restaurant,
    required Menu menu,
  }) {
    if (cart.containsKey(restaurant)) {
      Map<Menu, int> cartForRestaurant = cart[restaurant]!;
      cartForRestaurant.remove(menu);
    }
    notifyListeners();
  }

  void addMenuToCart({
    required Restaurant restaurant,
    required Menu menu,
  }) {
    if (cart.containsKey(restaurant)) {
      final cartForRestaurant = cart[restaurant]!;
      if (cartForRestaurant.containsKey(menu)) {
        cartForRestaurant[menu] = cartForRestaurant[menu]! + 1;
      } else {
        cartForRestaurant[menu] = 1;
      }
    } else {
      cart[restaurant] = <Menu, int>{
        menu: 1,
      };
    }
    notifyListeners();
  }

  void clearAll() {
    cart = {};
  }

  Future<void> orderFromCart({
    required Restaurant restaurant,
    required AyoMaemUser user,
  }) async {
    final subtotal = subtotalForRestaurant(restaurant);
    final tax = taxAndFees(restaurant);
    final totalRestaurant = total(restaurant);
    final timestamp = DateTime.now();
    final userId = user.uid;
    final restaurantId = restaurant.uid;
    final orders = cartForRestaurant(restaurant)?.map((key, value)
    => MapEntry(key.uid, value)) ?? <String, int>{};

    await firestoreController.createOrder(
        subtotal: subtotal,
        tax: tax,
        totalRestaurant: totalRestaurant,
        timestamp: timestamp,
        userId: userId,
        restaurantId: restaurantId,
        orders: orders,
    );

    await Future.delayed(const Duration(seconds: 2), () {});

    cart = {};
    notifyListeners();
  }

}