import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';

class FoodCategoryItem extends StatelessWidget {
  const FoodCategoryItem({
    Key? key,
    required this.text,
    required this.imageRef,
    this.enabled = false,
  }) : super(key: key);

  final String text;
  final String imageRef;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8.0,
      ),
      decoration: BoxDecoration(
        color: enabled
            ? context.colors.primary
            : Colors.white,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.white,
              child: Image.asset(
                imageRef,
                height: 24.0,
                width: 24.0,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  text,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: enabled ? Colors.white : ThemeColors.textColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
