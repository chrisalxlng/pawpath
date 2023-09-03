import "package:flutter/material.dart";
import "package:pawpath/storybook/notifier.dart";
import "package:pawpath/storybook/util.dart";
import "package:storybook_flutter/storybook_flutter.dart";

class ThemePlugin extends Plugin {
  ThemePlugin()
      : super(
            icon: (_) => ValueListenableBuilder(
                valueListenable: brightnessNotifier,
                builder: (_, brightness, __) => Icon(isLightTheme(brightness)
                    ? Icons.brightness_5_outlined
                    : Icons.brightness_3_outlined)),
            onPressed: (_) => changeBrightness());
}
