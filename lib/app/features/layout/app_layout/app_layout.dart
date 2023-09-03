import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide NavigationBar;
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar.type.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar_destination.dart';

final List<NavigationBarDestination> destinations = [
  NavigationBarDestination(
      key: const ValueKey(NavigationBarKey.today),
      label: "Today",
      icon: CupertinoIcons.today_fill,
      callback: () => debugPrint("Today destination pressed")),
  NavigationBarDestination(
      key: const ValueKey(NavigationBarKey.history),
      label: "History",
      icon: CupertinoIcons.book_fill,
      callback: () => debugPrint("History destination pressed")),
  NavigationBarDestination(
      key: const ValueKey(NavigationBarKey.stats),
      label: "Stats",
      icon: CupertinoIcons.chart_pie_fill,
      callback: () => debugPrint("Stats destination pressed")),
  NavigationBarDestination(
      key: const ValueKey(NavigationBarKey.settings),
      label: "Settings",
      icon: CupertinoIcons.gear_alt_fill,
      callback: () => debugPrint("Settings destination pressed")),
];

class AppLayout extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final NavigationBarKey activeDestinationKey;
  final Widget child;

  const AppLayout(
      {super.key,
      required this.appBar,
      required this.activeDestinationKey,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: NavigationBar(
          activeDestinationKey: activeDestinationKey,
          destinations: destinations),
      body: child,
    );
  }
}
