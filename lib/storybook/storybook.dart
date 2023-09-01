import 'package:flutter/material.dart';
import 'package:pawpath/storybook/plugins/language_plugin.dart';
import 'package:pawpath/storybook/plugins/theme_plugin.dart';
import 'package:pawpath/storybook/stories.dart';
import 'package:pawpath/storybook/util.dart';
import 'package:pawpath/storybook/wrapper_builder.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const StorybookApp());
}

class StorybookApp extends StatefulWidget {
  const StorybookApp({super.key});

  @override
  State<StorybookApp> createState() => _StorybookAppState();
}

class _StorybookAppState extends State<StorybookApp> {
  int _localeIndex = 0;
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) => Storybook(
        plugins: [
          ThemePlugin(_brightness, changeTheme),
          LanguagePlugin(changeLanguage)
        ],
        wrapperBuilder: (context, child) =>
            defaultWrapper(context, _localeIndex, _brightness, child),
        stories: stories,
      );

  changeLanguage() {
    setState(() {
      _localeIndex++;
    });
  }

  changeTheme() {
    setState(() {
      _brightness =
          isLightTheme(_brightness) ? Brightness.dark : Brightness.light;
    });
  }
}
