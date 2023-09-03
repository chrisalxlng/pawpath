import 'package:pawpath/app/counter/counter.story.dart';
import 'package:pawpath/app/features/layout/app_bar/app_bar.story.dart';
import 'package:pawpath/app/ui/buttons/icon_button/icon_button.story.dart';
import 'package:pawpath/app/ui/buttons/text_button/text_button.story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Story> stories = [
  appBarStory,
  iconButtonStory,
  textButtonStory,
  counterStory
];
