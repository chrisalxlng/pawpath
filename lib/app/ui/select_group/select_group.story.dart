import "package:flutter/material.dart";
import "package:pawpath/app/ui/select_group/select_group.dart";
import "package:pawpath/app/ui/select_group/select_group.type.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

const List<SelectGroupOption> options = [
  SelectGroupOption(key: ValueKey(1), label: "Option 1"),
  SelectGroupOption(key: ValueKey(2), label: "Option 2"),
  SelectGroupOption(key: ValueKey(3), label: "Option 3"),
  SelectGroupOption(key: ValueKey(4), label: "Option 4"),
];

const List<ValueKey> selectedOptionKeys = [ValueKey(1), ValueKey(4)];

final Story selectGroupStory = uiStoryWithKnobs(
  "SelectGroup",
  (context) => SelectGroup(
      options: options,
      selectedOptionKeys:
          context.knobs.boolean(label: "Unselect all", initial: false)
              ? []
              : selectedOptionKeys,
      onChanged: (selectedOptionKeys) =>
          debugPrint("Selected option keys: ${selectedOptionKeys.toString()}")),
);
