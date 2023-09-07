import "package:flutter/cupertino.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/buttons/button.dart";

class ElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isDisabled;
  final Color color;
  final double size;

  const ElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    required this.color,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
        builder: (color, textColor) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppBorderRadius.md),
                  color: color),
              padding: const EdgeInsets.all(AppSpacing.p4),
              child: Center(
                heightFactor: 1,
                widthFactor: 1,
                child: Text(label,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: size)),
              ),
            ),
        onPressed: onPressed,
        isDisabled: isDisabled,
        color: color);
  }
}
