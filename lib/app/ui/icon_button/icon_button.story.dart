import 'package:flutter/material.dart' hide IconButton;
import 'package:pawpath/app/ui/icon_button/icon_button.dart';
import 'package:pawpath/storybook/story_types.dart';
import 'package:pawpath/themes.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story iconButtonStory = uiStoryWithKnobs(
  "IconButton",
  (context) => IconButton(
    onPressed: () => debugPrint("IconButton pressed"),
    iconData: Icons.add_circle,
    color: AppColors.primary_100,
    size: context.knobs.slider(label: "Size", min: 0, initial: 24, max: 96),
  ),
);
