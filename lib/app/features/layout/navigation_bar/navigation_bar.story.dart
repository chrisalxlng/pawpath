import 'package:flutter/cupertino.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar.type.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar_destination.dart';
import 'package:pawpath/storybook/story_types.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

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

final Story navigationBarStory = featureStoryWithKnobs(
  "Layout",
  "NavigationBar",
  (context) => NavigationBar(
      activeItemKey: context.knobs.options(
          label: "Active destination",
          initial: NavigationBarKey.today,
          options: NavigationBarKey.values
              .map((key) => Option(label: key.toString(), value: key))
              .toList()),
      destinations: destinations),
);
