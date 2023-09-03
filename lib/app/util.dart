import 'package:flutter/material.dart';

Color darkenColor(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

double getBottomSafeArea(BuildContext context) =>
    MediaQuery.of(context).padding.bottom;

bool isLightTheme(BuildContext context) =>
    Theme.of(context).brightness == Brightness.light;
