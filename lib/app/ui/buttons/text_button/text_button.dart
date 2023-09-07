import "package:flutter/material.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/buttons/button.dart";

class TextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isDisabled;
  final Color color;
  final double size;

  const TextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    required this.color,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
        builder: (color, _) => Padding(
            padding: const EdgeInsets.all(AppSpacing.p1),
            child: Text(
              label,
              style: TextStyle(fontSize: size, color: color, height: 1),
            )),
        onPressed: onPressed,
        isDisabled: isDisabled,
        color: color);
  }
}
