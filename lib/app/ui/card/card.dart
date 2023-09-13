import "package:flutter/material.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/touchable/touchable.dart";

class Card extends StatelessWidget {
  final bool isBorderActive;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color color;
  final Color borderColor;

  const Card(
      {super.key,
      this.isBorderActive = false,
      this.child,
      this.onPressed,
      required this.color,
      this.borderColor = AppColors.primary_100});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Touchable(
            child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onPressed?.call(),
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(AppBorderRadius.md),
                border: Border.all(
                    color: isBorderActive ? borderColor : color, width: 3)),
            padding: const EdgeInsets.all(AppSpacing.p4),
            child: child,
          ),
        ))
      ],
    );
  }
}
