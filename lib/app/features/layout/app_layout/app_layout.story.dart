import 'package:flutter/material.dart' hide AppBar;
import 'package:pawpath/app/features/layout/app_bar/app_bar.dart';
import 'package:pawpath/app/features/layout/app_layout/app_layout.dart';
import 'package:pawpath/app/features/layout/navigation_bar/navigation_bar.type.dart';
import 'package:pawpath/storybook/story_types.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story appLayoutStory = featureStory(
  "Layout",
  AppLayout(
      appBar: const AppBar(title: "Title"),
      activeDestinationKey: NavigationDestinationKey.today,
      child: Container(
        color: Colors.red,
      )),
);
