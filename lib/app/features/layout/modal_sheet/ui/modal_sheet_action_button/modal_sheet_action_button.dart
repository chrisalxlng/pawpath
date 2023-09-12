import "package:flutter/material.dart" hide ElevatedButton;
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/buttons/elevated_button/elevated_button.dart";

class ModalSheetActionButton extends StatelessWidget {
  final ModalSheetAction action;

  const ModalSheetActionButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.p4, vertical: AppSpacing.p2),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              label: action.label,
              isDisabled: action.isDisabled,
              onPressed: () => action.onPressed?.call(),
              color: AppColors.primary_100)),
    ));
  }
}
