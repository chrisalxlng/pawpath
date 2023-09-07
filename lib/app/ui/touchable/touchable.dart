import "package:flutter/material.dart";

class Touchable extends StatelessWidget {
  final bool isDisabled;
  final Widget child;

  const Touchable({super.key, required this.child, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: isDisabled
            ? SystemMouseCursors.forbidden
            : SystemMouseCursors.click,
        child: child);
  }
}
