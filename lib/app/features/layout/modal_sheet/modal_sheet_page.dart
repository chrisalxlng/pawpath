import "package:flutter/material.dart";
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
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        builder: (context) => ColoredBox(
            color: AppColors.backgroundSecondary(context),
            child: FractionallySizedBox(
              heightFactor: 1 - (level - 1) * heightFactorDifferencePerLevel,
              child: child,
            )),
        isScrollControlled: true,
        useSafeArea: true,
      );
}
