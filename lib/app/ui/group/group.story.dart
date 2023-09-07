import "package:flutter/material.dart";
import "package:pawpath/app/ui/group/group.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story groupStory = uiStoryWithKnobs(
    "Group",
    (context) => Group(
          options: options,
          spacing: context.knobs.slider(label: "Spacing", min: 0, max: 100),
        ));

List<Container> options = [
  Container(
    color: Colors.red,
    height: 50,
    width: double.infinity,
  ),
  Container(
    color: Colors.red,
    height: 50,
    width: double.infinity,
  ),
  Container(
    color: Colors.red,
    height: 50,
    width: double.infinity,
  ),
];
