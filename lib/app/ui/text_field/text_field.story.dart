import "package:pawpath/app/ui/text_field/text_field.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story textFieldStory = uiStoryWithKnobs(
  "TextField",
  (context) => TextField(
    label: context.knobs.text(label: "Label", initial: "Some label"),
    value: "Initial value",
    placeholder:
        context.knobs.text(label: "Placeholder", initial: "Placeholder"),
  ),
);
