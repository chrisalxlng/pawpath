import "package:flutter/cupertino.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/card/card.dart";

class Select extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool isSelected)? onChanged;
  final Color color;
  final Color accentColor;

  const Select(
      {super.key,
      required this.label,
      this.isSelected = true,
      this.onChanged,
      this.color = AppColors.light_100,
      this.accentColor = AppColors.primary_100});

  @override
  Widget build(BuildContext context) {
    return Card(
        onPressed: () => onChanged?.call(!isSelected),
        isBorderActive: isSelected,
        color: color,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            label,
            style: TextStyle(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w500),
          ),
          CupertinoCheckbox(
            value: isSelected,
            onChanged: (_) => onChanged?.call(!isSelected),
            activeColor: accentColor,
            side: BorderSide(width: 2, color: accentColor),
          )
        ]));
  }
}
