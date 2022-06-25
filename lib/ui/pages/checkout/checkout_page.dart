import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/domain/%20models/menu.dart';
import 'package:flutter_food_order/core/domain/%20models/restaurant.dart';
import 'package:flutter_food_order/core/models/auth_model.dart';
import 'package:flutter_food_order/core/models/booking_model.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

enum CheckoutPageState {
  IDLE,
  LOADING,
  COMPLETED
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  var _state = CheckoutPageState.IDLE;

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

  Widget _checkoutItem(BuildContext context, Menu menu) {
    final bookingModel = context.watch<BookingModel>();
    final menuCount = bookingModel.menuCount(
        restaurant: widget.restaurant,
        menu: menu,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 75.0,
          height: 75.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: menu.image!,
              width: 75.0,
              height: 75.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8.0,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                menu.name!,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4.0,),
              Text(
                menu.description!,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4.0,),
              Text(
                '\$${menu.price}',
                style: context.textTheme.bodyMedium?.primary,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                bookingModel.clearMenuFromCart(
                    restaurant: widget.restaurant,
                    menu: menu,
                );
              },
              child: Icon(
                Icons.close,
                size: 16.0,
                color: context.colors.primary,
              ),
            ),
            const SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    bookingModel.decreaseMenuFromCart(
                        restaurant: widget.restaurant,
                        menu: menu,
                    );
                  },
                  child: Container(
                    height: 24.0,
                    width: 24.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colors.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        size: 16.0,
                        color: context.colors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0,),
                Text(
                  menuCount.toString(),
                  style: context.textTheme.bodyMedium?.primary,
                ),
                const SizedBox(width: 8.0,),
                InkWell(
                  onTap: () {
                    bookingModel.addMenuToCart(
                      restaurant: widget.restaurant,
                      menu: menu,
                    );
                  },
                  child: Container(
                    height: 24.0,
                    width: 24.0,
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _checkoutItems(BuildContext context) {
    final bookingModel = context.watch<BookingModel>();
    final cart = bookingModel.cartForRestaurant(widget.restaurant);
    if (cart?.isEmpty ?? true) {
      return [Text(
        'No Items in cart!',
        style: context.textTheme.bodyMedium,
      )];
    }

    return cart?.keys.map((e) => _checkoutItem(context, e))?.toList() ?? [];
  }

  Widget _mainWidget(BuildContext context) {
    final bookingModel = context.watch<BookingModel>();
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Center(
          child: Text(
            'Cart',
            style: context.textTheme.bodyLarge?.copyWith(
              fontSize: 20.0,
            ),
          ),
        ),
        const SizedBox(height: 24.0,),
        ..._checkoutItems(context),
        const SizedBox(height: 24.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Subtotal',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '\$${bookingModel.subtotalForRestaurant(widget.restaurant)}',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.5,
          color: ThemeColors.greyColor.withOpacity(0.1),
        ),
        const SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Tax and Fees',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '\$${bookingModel.taxAndFees(widget.restaurant)}',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.5,
          color: ThemeColors.greyColor.withOpacity(0.1),
        ),
        const SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Delivery',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '\$${bookingModel.delivery}',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.5,
          color: ThemeColors.greyColor.withOpacity(0.1),
        ),
        const SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                '(${bookingModel.totalCartForRestaurant(widget.restaurant)} items)',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.0,
                  color: ThemeColors.greyColor,
                ),
              ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '\$${bookingModel.subtotalForRestaurant(widget.restaurant)}',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 48.0,),
        Divider(
          thickness: 1.5,
          color: ThemeColors.greyColor.withOpacity(0.1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Total',
                style: context.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '\$${bookingModel.total(widget.restaurant).toStringAsFixed(2)}',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _state == CheckoutPageState.LOADING
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'res/anim/loading.json',
                  ),
                  Text(
                    'Waiting for order...',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge,
                  )
                ],
              ),
            )
            : _state == CheckoutPageState.COMPLETED
              ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'res/anim/completed.json',
              ),
              Text(
                'Your order is completed!',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        )
              : Stack(
          children: [
            _mainWidget(context),
            Positioned(
              top: 8.0,
              left: 16.0,
              child: _backBtn(context),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _state != CheckoutPageState.IDLE
          ? null
          : Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FloatingActionButton.extended(
          onPressed: () async {
            final bookingModel = context.read<BookingModel>();
            final authModel = context.read<AuthModel>();
            setState(() {
              _state = CheckoutPageState.LOADING;
            });
            await bookingModel.orderFromCart(
                restaurant: widget.restaurant,
                user: authModel.user!,
            );
            setState(() {
              _state = CheckoutPageState.COMPLETED;
            });
            await Future.delayed(const Duration(seconds: 2), () {});
            context.showMessageSnackbar(text: 'Booking success!');
            context.popUntilRoot();
          },
          backgroundColor: context.colors.primary,
          label: Text(
            'Checkout',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
