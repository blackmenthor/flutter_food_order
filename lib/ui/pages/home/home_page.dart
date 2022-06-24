import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/components/featured_restaurants_item.dart';
import 'package:flutter_food_order/ui/components/food_category_item.dart';
import 'package:flutter_food_order/ui/components/home_appbar.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late TextEditingController _searchCtrl;

  @override
  void initState() {
    super.initState();

    // TODO: ON CHANGED
    _searchCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();

    super.dispose();
  }

  Widget _topTitle(BuildContext context)
    => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'What would you like to\norder',
        style: context.textTheme.bodyLarge,
      ),
    );

  Widget _searchBox(BuildContext context)
    => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                fillColor: ThemeColors.greyColor20,
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.orangeColor.withOpacity(0.05),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.textColor.withOpacity(0.05),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.textColor.withOpacity(0.05),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                hintText: 'Find for food or restaurant',
              ),
            ),
          ),
          const SizedBox(width: 16.0,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ThemeColors.textColor.withOpacity(0.05),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                Images.icSettings,
                height: 18.0,
                width: 18.0,
              ),
            ),
          ),
        ],
      ),
    );

  Widget _foodCategoryList(BuildContext context)
    => SizedBox(
      height: 95.0,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          FoodCategoryItem(
              text: 'Burger',
              imageRef: Images.icAngga,
              enabled: true,
          ),
          FoodCategoryItem(
            text: 'Donat',
            imageRef: Images.icAngga,
          ),
          FoodCategoryItem(
            text: 'Pizza',
            imageRef: Images.icAngga,
          ),
          FoodCategoryItem(
            text: 'Mexican',
            imageRef: Images.icAngga,
          ),
          FoodCategoryItem(
            text: 'Asian',
            imageRef: Images.icAngga,
          ),
          FoodCategoryItem(
            text: 'European',
            imageRef: Images.icAngga,
          ),
          FoodCategoryItem(
            text: 'Latino',
            imageRef: Images.icAngga,
          ),
        ],
      ),
    );

  Widget _featuredRestaurantsTitle(BuildContext context)
  => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Featured Restaurants',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 20.0,
          ),
        ),
        const Spacer(),
        Text(
          'View All',
          style: context.textTheme.bodySmall?.primary,
        ),
        const SizedBox(width: 4.0,),
        Icon(
          Icons.chevron_right,
          size: 16.0,
          color: context.colors.primary,
        )
      ],
    ),
  );

  Widget _featuredRestaurants(BuildContext context)
    => SizedBox(
      height: 235.0,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        children: [
          // TODO: DATA
          FeaturedRestaurantsItem(
              text: 'McDonalds',
              image: Images.taco,
              rating: 4.5,
              ratingCount: 40,
              deliveryEstimation: "10-15 mins",
              categories: const ['Burger','Chicken', 'Fast Food'],
              deliveryCost: 0,
              isWishlisted: true,
          ),
          FeaturedRestaurantsItem(
            text: 'McDonalds',
            image: Images.taco,
            rating: 4.5,
            ratingCount: 40,
            deliveryEstimation: "10-15 mins",
            categories: const ['Burger','Chicken', 'Fast Food'],
            deliveryCost: 0,
          ),
          FeaturedRestaurantsItem(
            text: 'McDonalds',
            image: Images.taco,
            rating: 4.5,
            ratingCount: 40,
            deliveryEstimation: "10-15 mins",
            categories: const ['Burger','Chicken', 'Fast Food'],
            deliveryCost: 0,
          ),
          FeaturedRestaurantsItem(
            text: 'McDonalds',
            image: Images.taco,
            rating: 4.5,
            ratingCount: 40,
            deliveryEstimation: "10-15 mins",
            categories: const ['Burger','Chicken', 'Fast Food'],
            deliveryCost: 0,
          ),
        ],
      ),
    );

  Widget _popularItemsTitle(BuildContext context)
  => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Popular Items',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 20.0,
          ),
        ),
        const Spacer(),
        Text(
          'View All',
          style: context.textTheme.bodySmall?.primary,
        ),
        const SizedBox(width: 4.0,),
        Icon(
          Icons.chevron_right,
          size: 16.0,
          color: context.colors.primary,
        )
      ],
    ),
  );

  Widget _popularItems(BuildContext context)
  => SizedBox(
    height: 235.0,
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      scrollDirection: Axis.horizontal,
      children: [
        // TODO: DATA
        FeaturedRestaurantsItem(
          text: 'McDonalds',
          image: Images.taco,
          rating: 4.5,
          ratingCount: 40,
          deliveryEstimation: "10-15 mins",
          categories: const ['Burger','Chicken', 'Fast Food'],
          deliveryCost: 0,
        ),
        FeaturedRestaurantsItem(
          text: 'McDonalds',
          image: Images.taco,
          rating: 4.5,
          ratingCount: 40,
          deliveryEstimation: "10-15 mins",
          categories: const ['Burger','Chicken', 'Fast Food'],
          deliveryCost: 0,
        ),
        FeaturedRestaurantsItem(
          text: 'McDonalds',
          image: Images.taco,
          rating: 4.5,
          ratingCount: 40,
          deliveryEstimation: "10-15 mins",
          categories: const ['Burger','Chicken', 'Fast Food'],
          deliveryCost: 0,
        ),
        FeaturedRestaurantsItem(
          text: 'McDonalds',
          image: Images.taco,
          rating: 4.5,
          ratingCount: 40,
          deliveryEstimation: "10-15 mins",
          categories: const ['Burger','Chicken', 'Fast Food'],
          deliveryCost: 0,
        ),
      ],
    ),
  );

  Widget _buildBody(BuildContext context)
    => ListView(
      children: [
        const SizedBox(height: 16.0,),
        _topTitle(context),
        const SizedBox(height: 16.0,),
        _searchBox(context),
        const SizedBox(height: 16.0,),
        _foodCategoryList(context),
        const SizedBox(height: 24.0,),
        _featuredRestaurantsTitle(context),
        const SizedBox(height: 8.0,),
        _featuredRestaurants(context),
        const SizedBox(height: 24.0,),
        _popularItemsTitle(context),
        const SizedBox(height: 8.0,),
        _popularItems(context),
      ],
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: _buildBody(context),
    );
  }
}
