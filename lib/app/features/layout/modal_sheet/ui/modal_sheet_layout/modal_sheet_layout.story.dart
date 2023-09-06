import "package:flutter/material.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story modalSheetLayoutStory = featureStoryWithKnobs(
  "Layout",
  "ModalSheetLayout",
  (context) => ModalSheetLayout(
      appBar: const HeaderBar(title: "Title"),
      action: context.knobs.boolean(label: "Show action", initial: true)
          ? const ModalSheetAction(label: "Action")
          : null,
      child: Container(
        color: Colors.red,
        height: 300,
      )),
);
