import 'package:flutter/material.dart';
import 'package:pawpath/storybook/util.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ThemePlugin extends Plugin {
  final Brightness brightness;
  final VoidCallback onThemeChange;

  ThemePlugin(this.brightness, this.onThemeChange)
      : super(
            icon: (context) => Icon(isLightTheme(brightness)
                ? Icons.brightness_5_outlined
                : Icons.brightness_3_outlined),
            onPressed: (context) => onThemeChange());
}
