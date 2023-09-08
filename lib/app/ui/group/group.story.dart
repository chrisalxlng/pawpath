import "package:flutter/material.dart";
import "package:pawpath/app/ui/group/group.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

List<Container> children = [
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

final Story groupStory = uiStoryWithKnobs(
    "Group",
    (context) => Group(
          spacing: context.knobs.slider(label: "Spacing", min: 0, max: 100),
          children: children,
        ));
