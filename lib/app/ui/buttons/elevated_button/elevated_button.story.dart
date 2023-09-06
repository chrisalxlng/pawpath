import "package:flutter/material.dart"
    hide IconButton, TextButton, ElevatedButton;
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/buttons/elevated_button/elevated_button.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story elevatedButtonStory = uiStoryWithKnobs(
  "ElevatedButton",
  (context) => ElevatedButton(
    onPressed: () => debugPrint("ElevatedButton pressed"),
    label: context.knobs.text(label: "Label", initial: "Text"),
    color: AppColors.primary_100,
    size: context.knobs.slider(label: "Size", min: 0, initial: 24, max: 96),
  ),
);
