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
    width: 50,
  ),
  Container(
    color: Colors.red,
    height: 50,
    width: 100,
  ),
];

final Story groupStory = uiStoryWithKnobs(
    "Group",
    (context) => Group(
          spacing: context.knobs
              .slider(label: "Spacing", min: 0, initial: 10, max: 200),
          alignment: context.knobs.options(
              label: "Alignment",
              initial: CrossAxisAlignment.start,
              options: CrossAxisAlignment.values
                  .map((v) => Option(label: v.name, value: v))
                  .toList()),
          children: children,
        ));
