import "package:flutter/material.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_base_layout/modal_sheet_base_layout.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/storybook/story_types.dart";
import "package:storybook_flutter/storybook_flutter.dart";

final Story modalSheetBaseLayoutStory = featureStory(
  "Layout",
  ModalSheetBaseLayout(
      appBar: const HeaderBar(title: "Title"),
      child: Container(
        color: Colors.red,
        height: 300,
      )),
);
