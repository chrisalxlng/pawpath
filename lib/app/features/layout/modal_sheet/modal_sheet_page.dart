import "package:flutter/material.dart";
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";
import "package:pawpath/app/themes.dart";

class ModalBottomSheetPage<T> extends Page<T> {
  final Widget? child;

  const ModalBottomSheetPage({
    super.key,
    this.child,
  });

  @override
  Route<T> createRoute(BuildContext context) =>
      CupertinoModalBottomSheetRoute<T>(
        expanded: true,
        settings: this,
        bounce: true,
        closeProgressThreshold: 0.95,
        duration: const Duration(milliseconds: 300),
        builder: (context) => SafeArea(
            bottom: false,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.backgroundSecondary(context)),
              child: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: child,
              ),
            )),
      );
}
