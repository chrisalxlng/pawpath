import 'package:flutter/material.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar.type.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar_destination.dart';
import 'package:pawpath/app/themes.dart';
import 'package:pawpath/app/util.dart';

class NavigationBar extends StatelessWidget {
  final List<NavigationBarDestination> destinations;
  final NavigationBarKey activeItemKey;

  const NavigationBar(
      {super.key, required this.activeItemKey, required this.destinations});

  @override
  Widget build(BuildContext context) {
    final List<NavigationBarDestination> destinations = this
        .destinations
        .map((item) => NavigationBarDestination(
              label: item.label,
              icon: item.icon,
              isActive: item.key == ValueKey(activeItemKey),
              callback: item.callback,
            ))
        .toList();

    return Wrap(
      children: [
        Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary(context),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(117, 118, 122, 0.2),
                  offset: Offset(0, -4),
                  blurRadius: 32,
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(AppSpacing.p3, AppSpacing.p2,
                AppSpacing.p3, AppSpacing.p3 + getBottomSafeArea(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: destinations,
            ))
      ],
    );
  }
}
