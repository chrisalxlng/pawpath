import 'package:pawpath/app/example/example.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story exampleStory = Story(
  name: 'Widgets/Example',
  description: 'Simple example widget.',
  builder: (context) => const Example(),
);
