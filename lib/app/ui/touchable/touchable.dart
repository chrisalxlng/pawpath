import "package:flutter/material.dart";

class Touchable extends StatelessWidget {
  final Widget child;

  const Touchable({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(cursor: SystemMouseCursors.click, child: child);
  }
}
