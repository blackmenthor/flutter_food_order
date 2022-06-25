import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/models/location_model.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  bool hasLocation(BuildContext context)
  => context.watch<LocationModel>().currentPosition != null;

  String locationStr(BuildContext context) {
    final locationModel = context.watch<LocationModel>();
    final lat = locationModel.currentPosition?.latitude ?? '-';
    final lng = locationModel.currentPosition?.longitude ?? '-';
    return '$lat,$lng';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 52.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: const Icon(
                  Icons.more_vert,
                  size: 24.0,
                ),
              ),
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      // TODO: ONTAP
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Deliver to ',
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 16.0,
                                ),
                                alignment: PlaceholderAlignment.middle,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodySmall,
                        ),
                        !hasLocation(context)
                            ? const SizedBox(
                          height: 14.0,
                          width: 14.0,
                          child: CircularProgressIndicator(),
                        )
                            : Text(
                          locationStr(context),
                          style: context.textTheme.bodyMedium?.primary,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  Images.icAngga,
                  height: 32.0,
                  width: 32.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52.0);
}
