import "package:flutter/material.dart";
import "package:pawpath/app/features/layout/ui/navigation_bar/navigation_bar.type.dart";
import "package:pawpath/app/features/layout/ui/navigation_bar/navigation_bar_destination.dart";
import "package:pawpath/app/themes.dart";

class NavigationBar extends StatelessWidget {
  final List<NavigationBarDestination> destinations;
  final NavigationDestinationKey activeDestinationKey;

  const NavigationBar(
      {super.key,
      required this.activeDestinationKey,
      required this.destinations});

  @override
  Widget build(BuildContext context) {
    final List<NavigationBarDestination> destinations = this
        .destinations
        .map((item) => NavigationBarDestination(
              label: item.label,
              icon: item.icon,
              isActive: item.key == ValueKey(activeDestinationKey),
              callback: item.callback,
            ))
        .toList();

    return Wrap(
      children: [
        Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary(context),
              boxShadow: const [
                AppShadows.top,
              ],
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.p3, vertical: AppSpacing.p2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: destinations,
            ))
      ],
    );
  }
}
