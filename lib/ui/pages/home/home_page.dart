import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/models/auth_model.dart';
import 'package:flutter_food_order/core/models/location_model.dart';
import 'package:flutter_food_order/core/models/restaurant_model.dart';
import 'package:flutter_food_order/ui/components/featured_restaurants_item.dart';
import 'package:flutter_food_order/ui/components/home_appbar.dart';
import 'package:flutter_food_order/ui/pages/home/components/navigation_drawer.dart';
import 'package:flutter_food_order/ui/pages/login/login_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late TextEditingController _searchCtrl;

  @override
  void initState() {
    super.initState();

    _searchCtrl = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final locationModel = context.read<LocationModel>();
      locationModel.determinePosition();
    });
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

  Widget _featuredRestaurantsTitle(BuildContext context)
  => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
        // const Spacer(),
        // Text(
        //   'View All',
        //   style: context.textTheme.bodySmall?.primary,
        // ),
        // const SizedBox(width: 4.0,),
        // Icon(
        //   Icons.chevron_right,
        //   size: 16.0,
        //   color: context.colors.primary,
        // )
      ],
    ),
  );

  Widget _featuredRestaurants(BuildContext context) {
    final restaurantsModel = context.watch<RestaurantModel>();
    if (!restaurantsModel.hasData) {
      return const Center(
          child: SizedBox(
            height: 32.0,
            width: 32.0,
            child: CircularProgressIndicator(),
          ),
      );
    }

    final restaurants = restaurantsModel.restaurants;
    if (restaurants?.isEmpty ?? true) {
      return const Center(
        child: Text(
          'Empty Data...',
        ),
      );
    }

    return SizedBox(
      height: 235.0,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        children: restaurants?.map((restaurant)
          => FeaturedRestaurantsItem(
              restaurant: restaurant,
            ))?.toList() ?? [],
      ),
    );
  }

  Widget _popularItemsTitle(BuildContext context)
  => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
        // const Spacer(),
        // Text(
        //   'View All',
        //   style: context.textTheme.bodySmall?.primary,
        // ),
        // const SizedBox(width: 4.0,),
        // Icon(
        //   Icons.chevron_right,
        //   size: 16.0,
        //   color: context.colors.primary,
        // )
      ],
    ),
  );

  Widget _popularItems(BuildContext context) {
    final restaurantsModel = context.watch<RestaurantModel>();
    if (!restaurantsModel.hasData) {
      return const Center(
        child: SizedBox(
          height: 32.0,
          width: 32.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    final restaurants = restaurantsModel.restaurants;
    if (restaurants?.isEmpty ?? true) {
      return const Center(
        child: Text(
          'Empty Data...',
        ),
      );
    }

    return SizedBox(
      height: 235.0,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        children: restaurants?.where((e) => e.isFavorite)?.map((restaurant)
        => FeaturedRestaurantsItem(
          restaurant: restaurant,
        ))?.toList() ?? [],
      ),
    );
  }

  Widget _buildBody(BuildContext context)
    => ListView(
      children: [
        const SizedBox(height: 16.0,),
        _topTitle(context),
        const SizedBox(height: 16.0,),
        _searchBox(context),
        // const SizedBox(height: 16.0,),
        // _foodCategoryList(context),
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
    if (!context.watch<AuthModel>().isLoggedIn) {
      return const LoginPage();
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: const NavigationDrawer(),
      body: _buildBody(context),
    );
  }
}
