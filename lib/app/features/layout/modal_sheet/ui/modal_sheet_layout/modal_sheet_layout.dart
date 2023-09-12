import "package:flutter/material.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_action_button/modal_sheet_action_button.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_base_layout/modal_sheet_base_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/themes.dart";

class ModalSheetLayout extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget child;
  final ModalSheetAction? action;

  const ModalSheetLayout(
      {super.key, required this.appBar, required this.child, this.action});

  @override
  Widget build(BuildContext context) {
    final action = this.action;

    return ModalSheetBaseLayout(
        appBar: appBar,
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              physics: const RangeMaintainingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.p4, vertical: AppSpacing.p8),
                child: child,
              ),
            )),
            if (action != null) ModalSheetActionButton(action: action),
          ],
        ));
  }
}
