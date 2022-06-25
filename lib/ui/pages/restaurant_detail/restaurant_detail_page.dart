import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/domain/%20models/restaurant.dart';
import 'package:flutter_food_order/core/models/booking_model.dart';
import 'package:flutter_food_order/core/models/menu_model.dart';
import 'package:flutter_food_order/ui/components/menu_item_card.dart';
import 'package:flutter_food_order/ui/pages/checkout/checkout_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:provider/provider.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {

  PreferredSizeWidget _buildAppBar(BuildContext context)
    => AppBar(
      leading: InkWell(
        onTap: () => context.pop(),
        child: const Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
      ),
      title: Text(
        widget.restaurant.name ?? '-',
      ),
      titleTextStyle: context.textTheme.bodyMedium?.copyWith(
        color: Colors.white,
        fontSize: 24.0,
      ),
    );

  Widget _topImage(BuildContext context)
    => ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: CachedNetworkImage(
        imageUrl: widget.restaurant.image!,
        width: double.infinity,
      ),
    );

  Widget _descriptionWidget(BuildContext context)
    => Text(
      widget.restaurant.description ?? '-',
      style: context.textTheme.bodyMedium?.copyWith(
        color: ThemeColors.greyColor,
      ),
    );

  Widget _ratingWidget(BuildContext context)
    => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Images.icStar,
          height: 24.0,
          width: 24.0,
        ),
        const SizedBox(width: 8.0,),
        Text(
          widget.restaurant.rating?.toString() ?? '-',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(width: 4.0,),
        Text(
          '(${widget.restaurant.ratingCount})',
          style: context.textTheme.bodyMedium?.copyWith(
              color: ThemeColors.greyColor
          ),
        ),
        const SizedBox(width: 8.0,),
        Image.asset(
          Images.icLocation,
          height: 18.0,
          width: 18.0,
          color: context.colors.primary,
        ),
        const SizedBox(width: 8.0,),
        Text(
          widget.restaurant.location ?? '-',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );

  Widget _sortWidget(BuildContext context)
    => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Sort by:',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(
          width: 16.0,
        ),
        InkWell(
          onTap: () {
            // TODO: ONTAP
          },
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Popular',
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: context.colors.primary,
                    size: 16.0,
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
              ],
            ),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.primary,
            ),
          ),
        ),

      ],
    );

  List<Widget> _menusWidget(BuildContext context) {
    final menuModel = context.watch<MenuModel>();
    if (!menuModel.hasData) {
      return [const Center(
        child: SizedBox(
          height: 32.0,
          width: 32.0,
          child: CircularProgressIndicator(),
        ),
      )];
    }

    final menus = menuModel.menus;
    if (menus?.isEmpty ?? true) {
      return [const Center(
        child: Text(
          'Empty Data...',
        ),
      )];
    }

    return menus?.map((e) => MenuItemCard(
        restaurant: widget.restaurant,
        menu: e,
      ))?.toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _topImage(context),
          const SizedBox(
            height: 16.0,
          ),
          _descriptionWidget(context),
          const SizedBox(
            height: 16.0,
          ),
          _ratingWidget(context),
          const SizedBox(
            height: 16.0,
          ),
          _sortWidget(context),
          const SizedBox(
            height: 16.0,
          ),
          ..._menusWidget(context),
          const SizedBox(
            height: 72.0,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (context) {
          final bookingModel = context.watch<BookingModel>();
          final cartForThisRestaurant = bookingModel
              .cartForRestaurant(widget.restaurant);
          final cartIsEmpty = cartForThisRestaurant?.isEmpty ?? true;
          return FloatingActionButton.extended(
              onPressed: cartIsEmpty ? null :() {
                context.push(builder: (ctx) => CheckoutPage(
                  restaurant: widget.restaurant,
                ));
              },
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: cartIsEmpty ? Image.asset(
                  Images.icCart,
                  height: 16.0,
                  width: 16.0,
                  color: context.colors.primary,
                ) : Text(
                  bookingModel.totalCartForRestaurant(widget.restaurant)!.toString(),
                  style: TextStyle(
                    color: context.colors.primary,
                  ),
                ),
              ),
              backgroundColor: context.colors.primary,
              label: Text(
                'Checkout',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
          );
        }
      ),
    );
  }
}
