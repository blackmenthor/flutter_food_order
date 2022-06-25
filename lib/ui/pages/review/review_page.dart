import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/domain/%20models/restaurant.dart';
import 'package:flutter_food_order/ui/pages/review_list/review_list_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 220.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: SizedBox(
                        height: 200.0,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            Images.pizza,
                            height: 200.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 8.0,
                        left: 8.0,
                        child: InkWell(
                          onTap: () {
                            context.popUntilRoot();
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
                        ),
                    ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        // TODO: CANCEL OUT IMAGE BELOW
                        child: CircleAvatar(
                          backgroundColor: context.colors.secondary,
                          radius: 48.0,
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: restaurant.image!,
                              width: 48.0,
                              height: 48.0,
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            Center(
              child: Text(
                restaurant.name!,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 22.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            Center(
              child: Text(
                restaurant.location!,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: ThemeColors.greyColor,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Container(
                          height: 8.0,
                          width: 8.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    TextSpan(
                      text: 'Order Delivered',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32.0,),
            Center(
              child: Text(
                'Please Rate Your Order',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 22.0,
                ),
              ),
            ),
            const SizedBox(height: 24.0,),
            Center(
              child: Text(
                'Good',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 22.0,
                  color: Colors.redAccent,
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.icStar,
                    height: 32.0,
                    width: 32.0,
                  ),
                  const SizedBox(width: 8.0,),
                  Image.asset(
                    Images.icStar,
                    height: 32.0,
                    width: 32.0,
                  ),
                  const SizedBox(width: 8.0,),
                  Image.asset(
                    Images.icStar,
                    height: 32.0,
                    width: 32.0,
                  ),
                  const SizedBox(width: 8.0,),
                  Image.asset(
                    Images.icStar,
                    height: 32.0,
                    width: 32.0,
                  ),
                  const SizedBox(width: 8.0,),
                  Image.asset(
                    Images.icStarEmpty,
                    height: 32.0,
                    width: 32.0,
                  ),
                  const SizedBox(width: 8.0,),
                ],
              ),
            ),
            const SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.greyColor.withOpacity(0.5),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.greyColor,
                    ),
                  ),
                  hintText: 'Write your review',
                ),
                minLines: 5,
                maxLines: 10,
              ),
            ),
            const SizedBox(height: 16.0,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FloatingActionButton.extended(
          onPressed: () async {
            // TODO: SUBMIT REVIEW
            context.pushAndReplace(builder: (_) => const ReviewListPage());
          },
          backgroundColor: context.colors.primary,
          label: Text(
            'Submit',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
