import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_action_button/modal_sheet_action_button.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story modalSheetActionButtonStory = featureStory(
  "Layout",
  const ModalSheetActionButton(
    action: ModalSheetAction(label: "Action"),
  ),
);
