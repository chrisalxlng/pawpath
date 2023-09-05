import "package:flutter/material.dart";
import "package:pawpath/app/features/layout/app/ui/app_layout/app_layout.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar.type.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story appLayoutStory = featureStory(
  "Layout",
  AppLayout(
      appBar: const HeaderBar(title: "Title"),
      activeDestinationKey: NavigationDestinationKey.today,
      child: Container(
        color: Colors.red,
      )),
);
