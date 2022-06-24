import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/pages/review/review_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:lottie/lottie.dart';

enum CheckoutPageState {
  IDLE,
  LOADING,
  COMPLETED
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

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

  Widget _checkoutItem(BuildContext context)
    => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 75.0,
          height: 75.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              Images.pizza,
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
                'Red n hot pizza',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4.0,),
              Text(
                'Spicy chicken',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4.0,),
              Text(
                '\$15.30',
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
                // TODO: CLEAR CHECKOUT ITEM
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
                Container(
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
                const SizedBox(width: 8.0,),
                Text(
                  '2',
                  style: context.textTheme.bodyMedium?.primary,
                ),
                const SizedBox(width: 8.0,),
                Container(
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
              ],
            ),
          ],
        ),
      ],
    );

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
            ListView(
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
                _checkoutItem(context),
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
                      '\$27.30',
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
                      '\5.30',
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
                      '\$1.00',
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
                        '(2 items)',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.0,
                          color: ThemeColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0,),
                    Text(
                      '\$1.00',
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
                      '\$25.00',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _state != CheckoutPageState.IDLE
          ? null
          : Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FloatingActionButton.extended(
          onPressed: () async {
            setState(() {
              _state = CheckoutPageState.LOADING;
            });
            await Future.delayed(const Duration(seconds: 2), () {});
            setState(() {
              _state = CheckoutPageState.COMPLETED;
            });
            await Future.delayed(const Duration(seconds: 1), () {});
            context.pushAndReplace(builder: (ctx) => const ReviewPage());
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
