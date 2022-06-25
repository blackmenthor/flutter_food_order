import 'package:copy_with_extension/copy_with_extension.dart';

part 'restaurant.g.dart';

@CopyWith()
class Restaurant {
  Restaurant({
    required this.uid,
    this.name,
    this.image,
    this.rating,
    this.ratingCount,
    this.timeEstimation,
    this.isFreeDelivery = false,
    this.category,
  });

  final String uid;
  final String? name;
  final String? image;
  final double? rating;
  final double? ratingCount;
  final String? timeEstimation;
  final bool isFreeDelivery;
  final List<dynamic>? category;
}