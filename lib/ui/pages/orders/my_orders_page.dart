import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/models/auth_model.dart';
import 'package:flutter_food_order/core/models/order_model.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ordersModel = context.read<OrderModel>();
      final authModel = context.read<AuthModel>();
      ordersModel.fetchOrdersForUser(userId: authModel.user!.uid);
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context)
    => AppBar(
      leading: InkWell(
        onTap: () => context.pop(),
        child: const Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
      ),
      title: const Text(
        'My Orders',
      ),
      titleTextStyle: context.textTheme.bodyMedium?.copyWith(
        color: Colors.white,
        fontSize: 24.0,
      ),
    );

  List<Widget> _menusWidget(BuildContext context) {
    final orderModel = context.watch<OrderModel>();
    if (!orderModel.hasData) {
      return [const Center(
        child: SizedBox(
          height: 32.0,
          width: 32.0,
          child: CircularProgressIndicator(),
        ),
      )];
    }

    final orders = orderModel.orders;
    if (orders?.isEmpty ?? true) {
      return [const Center(
        child: Text(
          'Empty Data...',
        ),
      )];
    }

    return orders?.map((e) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order No: ${e.uid}',
            ),
            Text(
              '\$${e.total?.toStringAsFixed(2) ?? 0.0}',
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
        const Divider(),
      ],
    ))?.toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(
            height: 16.0,
          ),
          ..._menusWidget(context),
          const SizedBox(
            height: 72.0,
          ),
        ],
      ),
    );
  }
}
