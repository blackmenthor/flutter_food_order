import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/domain/%20models/menu.dart';
import 'package:flutter_food_order/core/domain/%20models/restaurant.dart';
import 'package:flutter_food_order/core/models/booking_model.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:provider/provider.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    Key? key,
    required this.restaurant,
    required this.menu,
  }) : super(key: key);

  final Restaurant restaurant;
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final bookingModel = context.watch<BookingModel>();
    final menuCount = bookingModel.menuCount(restaurant: restaurant, menu: menu);
    return InkWell(
      onTap: () {
        bookingModel.addMenuToCart(restaurant: restaurant, menu: menu);
      },
      child: Stack(
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
                      CachedNetworkImage(
                          imageUrl: menu.image!,
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
                                  text: menu.price!.toStringAsFixed(2),
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // TODO: WISHLIST
                      if (menuCount > 0) ...[
                        Positioned(
                          top: 16.0,
                          right: 16.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  bookingModel.decreaseMenuFromCart(restaurant: restaurant, menu: menu);
                                },
                                child: CircleAvatar(
                                  backgroundColor: context.colors.primary,
                                  radius: 16.0,
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0,),
                              CircleAvatar(
                                backgroundColor: context.colors.primary,
                                child: Text(
                                  menuCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0,),
                              InkWell(
                                onTap: () {
                                  bookingModel.addMenuToCart(restaurant: restaurant, menu: menu);
                                },
                                child: CircleAvatar(
                                  backgroundColor: context.colors.primary,
                                  radius: 16.0,
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (false) ...[
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
                    menu.name!,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 4.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    menu.description!,
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
                      text: menu.rating!.toStringAsFixed(1),
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
                      text: '(${menu.ratingCount})',
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
      ),
    );
  }
}
