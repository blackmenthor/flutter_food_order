import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';

class FeaturedRestaurantsItem extends StatelessWidget {
  const FeaturedRestaurantsItem({
    Key? key,
    required this.text,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.deliveryEstimation,
    required this.categories,
    required this.deliveryCost,
    this.isWishlisted = false,
  }) : super(key: key);

  final String text;
  final String image;
  final double rating;
  final int ratingCount;
  final String deliveryEstimation;
  final List<String> categories;
  final double deliveryCost;
  final bool isWishlisted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  width: context.width * 0.75,
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          rating.toStringAsFixed(1),
                          style: context.textTheme.bodySmall,
                        ),
                        const SizedBox(width: 8.0,),
                        Image.asset(
                          Images.icStar,
                          height: 14.0,
                          width: 14.0,
                        ),
                        const SizedBox(width: 8.0,),
                        Text(
                          '(${ratingCount.toString()})',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: ThemeColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isWishlisted) ...[
                  Positioned(
                      top: 16.0,
                      right: 16.0,
                      child: CircleAvatar(
                        backgroundColor: context.colors.primary,
                        radius: 16.0,
                        child: Center(
                          child: Image.asset(
                            Images.icHeart,
                            height: 16.0,
                            width: 16.0,
                          ),
                        ),
                      ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: context.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 4.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.icDelivery,
                  height: 14.0,
                  width: 14.0,
                ),
                const SizedBox(width: 4.0,),
                // TODO: DATA
                Text(
                  'Free delivery',
                  style: context.textTheme.bodySmall,
                ),
                const SizedBox(width: 16.0,),
                Image.asset(
                  Images.icDeliveryTime,
                  height: 14.0,
                  width: 14.0,
                ),
                const SizedBox(width: 4.0,),
                Text(
                  deliveryEstimation,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: categories.map((e) => Container(
                margin: const EdgeInsets.only(right: 8.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: ThemeColors.greyColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  e,
                  style: context.textTheme.bodySmall?.copyWith(

                  ),
                ),
              )).toList(),
            ),
          ),
          const SizedBox(height: 8.0,),
        ],
      ),
    );
  }
}
