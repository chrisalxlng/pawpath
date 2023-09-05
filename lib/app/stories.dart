import "package:pawpath/app/counter/counter.story.dart";
import "package:pawpath/app/features/layout/app/ui/app_layout/app_layout.story.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar.story.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.story..dart";
import "package:pawpath/app/ui/buttons/icon_button/icon_button.story.dart";
import "package:pawpath/app/ui/buttons/text_button/text_button.story.dart";
import "package:pawpath/app/ui/select/select.story.dart";
import "package:pawpath/app/ui/select_group/select_group.story.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final List<Story> stories = [
  headerBarStory,
  navigationBarStory,
  appLayoutStory,
  iconButtonStory,
  textButtonStory,
  counterStory,
  selectStory,
  selectGroupStory
];
