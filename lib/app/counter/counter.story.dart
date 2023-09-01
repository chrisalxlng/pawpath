import 'package:pawpath/app/counter/counter.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story counterStory = Story(
  name: 'Widgets/Counter',
  description: 'Simple counter widget.',
  builder: (context) => const Counter(),
);
