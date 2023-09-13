import "package:flutter/cupertino.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/card/card.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story cardStory = uiStoryWithKnobs(
  "Card",
  (context) => Card(
    isBorderActive:
        context.knobs.boolean(label: "Is border active", initial: false),
    onPressed: () => debugPrint("Card was pressed"),
    color: AppColors.backgroundPrimary(context),
    child: const Text("Some content"),
  ),
);
