import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';

class ReviewListPage extends StatelessWidget {
  const ReviewListPage({
    Key? key,
  }) : super(key: key);

  Widget _backBtn(BuildContext context)
  => InkWell(
    onTap: () {
      context.pop();
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: const Icon(
        Icons.chevron_left,
        size: 24.0,
      ),
    ),
  );

  Widget _reviewItem(BuildContext context)
    => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 36.0,
              width: 36.0,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.asset(
                      Images.icAngga,
                      height: 32.0,
                      width: 32.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 16.0,
                        width: 16.0,
                        decoration: BoxDecoration(
                          color: context.colors.secondary,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Center(
                          child: Text(
                            '4.5',
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 8.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alyce Lambo',
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    '25/06/2020',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: ThemeColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
        Text(
          'Really convenient and the points system helps benefit loyalty. '
              'Some mild glitches here and there, but nothing too egregious. '
              'Obviously needs to roll out to more remote.',
          style: context.textTheme.bodyMedium?.copyWith(
            color: ThemeColors.greyColor,
          ),
        ),
      ],
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Center(
                  child: Text(
                    'Reviews',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0,),
                _reviewItem(context),
                const SizedBox(height: 24.0,),
                _reviewItem(context),
                const SizedBox(height: 24.0,),
              ],
            ),
            Positioned(
              top: 8.0,
              left: 16.0,
              child: _backBtn(context),
            ),
          ],
        ),
      ),
    );
  }
}
