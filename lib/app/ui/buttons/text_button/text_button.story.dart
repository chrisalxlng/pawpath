import 'package:flutter/material.dart' hide IconButton, TextButton;
import 'package:pawpath/app/ui/buttons/text_button/text_button.dart';
import 'package:pawpath/storybook/story_types.dart';
import 'package:pawpath/themes.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story textButtonStory = uiStoryWithKnobs(
  "TextButton",
  (context) => TextButton(
    onPressed: () => debugPrint("IconButton pressed"),
    label: context.knobs.text(label: "Label", initial: "Text"),
    color: AppColors.primary_100,
    size: context.knobs.slider(label: "Size", min: 0, initial: 24, max: 96),
  ),
);
