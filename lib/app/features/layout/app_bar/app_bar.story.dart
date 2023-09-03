import 'package:pawpath/app/features/layout/app_bar/app_bar.dart';
import 'package:pawpath/storybook/story_types.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story appBarStory = featureStoryWithKnobs(
  "Layout",
  "AppBar",
  (context) =>
      AppBar(title: context.knobs.text(label: "Title", initial: "Text")),
);
