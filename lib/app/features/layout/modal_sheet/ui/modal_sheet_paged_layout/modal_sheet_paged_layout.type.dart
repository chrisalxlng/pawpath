import "package:flutter/material.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";

class ModalSheetPage {
  final PreferredSizeWidget appBar;
  final Widget body;
  final ModalSheetAction action;

  const ModalSheetPage(
      {required this.appBar, required this.body, required this.action});
}

class ModalSheetPageController {
  late VoidCallback reset;
  late VoidCallback nextPage;
}

class ModalSheetPageState {
  final List<ModalSheetPage> pages;
  final PageController pageController;
  final BuildContext context;

  const ModalSheetPageState({
    required this.pages,
    required this.pageController,
    required this.context,
  });
}
