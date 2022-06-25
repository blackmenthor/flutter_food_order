import 'package:copy_with_extension/copy_with_extension.dart';

part 'order.g.dart';

@CopyWith()
class Order {
  Order({
    required this.uid,
    required this.restaurantId,
    required this.userId,
    this.delivery,
    this.subtotal,
    this.taxFees,
    this.total,
    this.orders,
  });

  final String uid;
  final String restaurantId;
  final String userId;
  final double? delivery;
  final double? subtotal;
  final double? taxFees;
  final double? total;
  final Map<String, int>? orders;
}