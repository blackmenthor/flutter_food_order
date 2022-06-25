import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/models/auth_models.dart';
import 'package:flutter_food_order/ui/pages/profile/profile_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModel = context.read<AuthModel>();
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48.0),
                child: Image.asset(
                  Images.icAngga,
                  height: 72.0,
                  width: 72.0,
                ),
              ),
              const SizedBox(height: 16.0,),
              Text(
                authModel.user?.name ?? '-',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 24.0,
                ),
              ),
              Text(
                authModel.user?.email ?? '-',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: ThemeColors.greyColor,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              ListTile(
                onTap: () {
                  // TODO: ONTAP
                },
                leading: Image.asset(
                  Images.icOrders,
                  height: 24.0,
                  width: 24.0,
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'My Orders',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ListTile(
                onTap: () {
                  context.push(builder: (ctx) => const ProfilePage());
                },
                leading: Image.asset(
                  Images.icProfile,
                  height: 24.0,
                  width: 24.0,
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'My Profile',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 18.0,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  final resp = await context.showPromptDialog(
                      title: 'Logout',
                      msg: 'Are you sure you want to logout?',
                  ) ?? false;
                  if (resp) {
                    context.read<AuthModel>().logout();
                  }
                },
                child: IntrinsicWidth(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.icPower,
                          height: 24.0,
                          width: 24.0,
                        ),
                        const SizedBox(width: 16.0,),
                        Text(
                          'Log Out',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16.0,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
