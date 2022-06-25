import 'package:copy_with_extension/copy_with_extension.dart';

part 'menu.g.dart';

@CopyWith()
class Menu {
  Menu({
    required this.uid,
    required this.restaurantId,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.ratingCount,
    this.price,
  });

  final String uid;
  final String restaurantId;
  final String? name;
  final String? description;
  final String? image;
  final double? rating;
  final double? ratingCount;
  final double? price;
}