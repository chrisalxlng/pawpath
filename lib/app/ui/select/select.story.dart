import "package:flutter/cupertino.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/select/select.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story selectStory = uiStoryWithKnobs(
  "Select",
  (context) => Select(
    label: context.knobs.text(label: "Label", initial: "Value"),
    isSelected: context.knobs.boolean(label: "Is selected", initial: false),
    onChanged: (isSelected) => debugPrint("Selection changed: $isSelected"),
    color: AppColors.backgroundPrimary(context),
  ),
);
