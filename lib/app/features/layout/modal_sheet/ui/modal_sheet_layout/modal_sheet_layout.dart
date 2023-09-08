import "package:flutter/material.dart" hide ElevatedButton;
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/buttons/elevated_button/elevated_button.dart";

class ModalSheetLayout extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget child;
  final ModalSheetAction? action;

  const ModalSheetLayout(
      {super.key, required this.appBar, required this.child, this.action});

  @override
  Widget build(BuildContext context) {
    final action = this.action;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: appBar,
          backgroundColor: AppColors.backgroundPrimary(context),
          body: Column(
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
              if (action != null)
                SafeArea(
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
                )),
            ],
          )),
    );
  }
}
