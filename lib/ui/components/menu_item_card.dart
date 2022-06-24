import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.isWishlisted = false,
    required this.rating,
    required this.ratingCount,
  }) : super(key: key);

  final String name;
  final String description;
  final String image;
  final double price;
  final bool isWishlisted;
  final double rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      width: context.width,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 16.0,
                      left: 16.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: context.textTheme.bodyMedium?.primary,
                              ),
                              TextSpan(
                                text: price.toStringAsFixed(2),
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
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
              const SizedBox(height: 24.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  name,
                  style: context.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 4.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ThemeColors.greyColor,
                  ),
                ),
              ),
              const SizedBox(height: 8.0,),
            ],
          ),
        ),
        Positioned(
          bottom: 70.0,
          left: 12.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: rating.toStringAsFixed(1),
                    style: context.textTheme.bodyMedium,
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Image.asset(
                        Images.icStar,
                        height: 12.0,
                        width: 12.0,
                      ),
                    ),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text: '($ratingCount)',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: ThemeColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
