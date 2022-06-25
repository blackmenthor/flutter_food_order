// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderCWProxy {
  Order delivery(double? delivery);

  Order orders(Map<String, int> orders);

  Order restaurantId(String restaurantId);

  Order subtotal(double? subtotal);

  Order taxFees(double? taxFees);

  Order total(double? total);

  Order uid(String uid);

  Order userId(String userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    double? delivery,
    Map<String, int>? orders,
    String? restaurantId,
    double? subtotal,
    double? taxFees,
    double? total,
    String? uid,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrder.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrder.copyWith.fieldName(...)`
class _$OrderCWProxyImpl implements _$OrderCWProxy {
  final Order _value;

  const _$OrderCWProxyImpl(this._value);

  @override
  Order delivery(double? delivery) => this(delivery: delivery);

  @override
  Order orders(Map<String, int> orders) => this(orders: orders);

  @override
  Order restaurantId(String restaurantId) => this(restaurantId: restaurantId);

  @override
  Order subtotal(double? subtotal) => this(subtotal: subtotal);

  @override
  Order taxFees(double? taxFees) => this(taxFees: taxFees);

  @override
  Order total(double? total) => this(total: total);

  @override
  Order uid(String uid) => this(uid: uid);

  @override
  Order userId(String userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    Object? delivery = const $CopyWithPlaceholder(),
    Object? orders = const $CopyWithPlaceholder(),
    Object? restaurantId = const $CopyWithPlaceholder(),
    Object? subtotal = const $CopyWithPlaceholder(),
    Object? taxFees = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return Order(
      delivery: delivery == const $CopyWithPlaceholder()
          ? _value.delivery
          // ignore: cast_nullable_to_non_nullable
          : delivery as double?,
      orders: orders == const $CopyWithPlaceholder() || orders == null
          ? _value.orders
          // ignore: cast_nullable_to_non_nullable
          : orders as Map<String, int>,
      restaurantId:
          restaurantId == const $CopyWithPlaceholder() || restaurantId == null
              ? _value.restaurantId
              // ignore: cast_nullable_to_non_nullable
              : restaurantId as String,
      subtotal: subtotal == const $CopyWithPlaceholder()
          ? _value.subtotal
          // ignore: cast_nullable_to_non_nullable
          : subtotal as double?,
      taxFees: taxFees == const $CopyWithPlaceholder()
          ? _value.taxFees
          // ignore: cast_nullable_to_non_nullable
          : taxFees as double?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as double?,
      uid: uid == const $CopyWithPlaceholder() || uid == null
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
    );
  }
}

extension $OrderCopyWith on Order {
  /// Returns a callable class that can be used as follows: `instanceOfOrder.copyWith(...)` or like so:`instanceOfOrder.copyWith.fieldName(...)`.
  _$OrderCWProxy get copyWith => _$OrderCWProxyImpl(this);
}
