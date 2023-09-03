import 'package:flutter/material.dart';
import 'package:pawpath/app/ui/buttons/button.dart';
import 'package:pawpath/themes.dart';

class TextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const TextButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.color,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
        builder: (color) => Padding(
            padding: const EdgeInsets.all(AppSpacing.p1),
            child: Text(
              label,
              style: TextStyle(fontSize: size, color: color, height: 1),
            )),
        onPressed: onPressed,
        color: color);
  }
}
