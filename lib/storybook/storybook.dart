import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/stories.dart";
import "package:pawpath/storybook/notifier.dart";
import "package:pawpath/storybook/plugins/device_plugin.dart";
import "package:pawpath/storybook/plugins/language_plugin.dart";
import "package:pawpath/storybook/plugins/theme_plugin.dart";
import "package:pawpath/storybook/plugins/ui_border_plugin.dart";
import "package:storybook_flutter/storybook_flutter.dart";

void main() {
  runApp(const ProviderScope(child: StorybookApp()));
}

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      valueListenable: storyTypeNotifier,
      builder: (_, storyType, __) => Storybook(
            plugins: [
              ThemePlugin(),
              LanguagePlugin(),
              if (storyType == StoryType.screen) DevicePlugin(),
              if (storyType != StoryType.screen) UiBorderPlugin(),
            ],
            stories: stories,
          ));
}
