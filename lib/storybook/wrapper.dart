import "package:flutter/material.dart" hide AppBar;
import "package:pawpath/app/features/layout/app_bar/app_bar.dart";
import "package:pawpath/app/features/layout/app_layout/app_layout.dart";
import "package:pawpath/app/features/layout/navigation_bar/navigation_bar.type.dart";
import "package:pawpath/l10n/l10n.dart";
import "package:pawpath/storybook/notifier.dart";
import "package:pawpath/storybook/plugins/device_plugin.dart";
import "package:storybook_flutter/storybook_flutter.dart";

deviceFrame(child) => ValueListenableBuilder(
    valueListenable: deviceIndexNotifier,
    builder: (_, deviceIndex, __) => DeviceFrame(
        device: devices[deviceIndex % devices.length], screen: child!));

materialApp(Widget? body) => ValueListenableBuilder(
      valueListenable: localeIndexNotifier,
      builder: (_, localeIndex, __) => ValueListenableBuilder(
          valueListenable: brightnessNotifier,
          builder: (_, brightness, __) => MaterialApp(
                theme: ThemeData(brightness: brightness),
                locale: locales[localeIndex % locales.length],
                localizationsDelegates: localizationDelegates,
                supportedLocales: locales,
                debugShowCheckedModeBanner: false,
                home: body,
              )),
    );

screenWrapper(Widget? child) {
  changeStoryType(StoryType.screen);
  return materialApp(Container(
    color: Colors.white,
    child: deviceFrame(AppLayout(
        appBar: const AppBar(title: "Title"),
        activeDestinationKey: NavigationDestinationKey.today,
        child: child!)),
  ));
}

uiWrapper(Widget? child) {
  changeStoryType(StoryType.ui);
  return materialApp(Material(
    child: Container(
        color: const Color.fromRGBO(73, 148, 236, 1),
        child: Center(child: child)),
  ));
}
