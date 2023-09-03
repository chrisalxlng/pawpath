import 'package:pawpath/app/ui/example/example.dart';
import 'package:pawpath/storybook/story_types.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story exampleStory = uiStoryWithKnobs(
    "Example",
    (context) => context.knobs.boolean(label: "Example knob", initial: true)
        ? const Example()
        : const Example());
