import "package:flutter/material.dart";
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";
import "package:pawpath/app/themes.dart";

const double heightFactorDifferencePerLevel = 0.03;

class ModalBottomSheetPage<T> extends Page<T> {
  final Widget? child;
  final int level;

  const ModalBottomSheetPage({
    super.key,
    this.child,
    this.level = 1,
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
