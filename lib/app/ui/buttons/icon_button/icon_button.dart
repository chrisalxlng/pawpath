import 'package:flutter/material.dart';
import 'package:pawpath/app/themes.dart';
import 'package:pawpath/app/ui/buttons/button.dart';

class IconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const IconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
    required this.color,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
        builder: (color) => Padding(
              padding: const EdgeInsets.all(AppSpacing.p1),
              child: SizedBox.square(
                dimension: size,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Icon(
                    iconData,
                    color: color,
                  ),
                ),
              ),
            ),
        onPressed: onPressed,
        color: color);
  }
}
