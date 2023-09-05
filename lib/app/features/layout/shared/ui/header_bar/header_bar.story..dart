import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story headerBarStory = featureStoryWithKnobs(
  "Layout",
  "HeaderBar",
  (context) =>
      HeaderBar(title: context.knobs.text(label: "Title", initial: "Text")),
);
