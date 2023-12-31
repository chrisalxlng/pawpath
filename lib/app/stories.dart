import "package:pawpath/app/features/layout/app/ui/app_layout/app_layout.story.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar.story.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_action_button/modal_sheet_action_button.story.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_base_layout/modal_sheet_base_layout.story.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.story.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.story.dart";
import "package:pawpath/app/ui/buttons/elevated_button/elevated_button.story.dart";
import "package:pawpath/app/ui/buttons/icon_button/icon_button.story.dart";
import "package:pawpath/app/ui/buttons/text_button/text_button.story.dart";
import "package:pawpath/app/ui/card/card.story.dart";
import "package:pawpath/app/ui/group/group.story.dart";
import "package:pawpath/app/ui/select/select.story.dart";
import "package:pawpath/app/ui/text_field/text_field.story.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final List<Story> stories = [
  headerBarStory,
  navigationBarStory,
  appLayoutStory,
  iconButtonStory,
  textButtonStory,
  elevatedButtonStory,
  selectStory,
  groupStory,
  modalSheetLayoutStory,
  textFieldStory,
  modalSheetBaseLayoutStory,
  modalSheetActionButtonStory,
  cardStory
];
