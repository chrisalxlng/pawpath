import "package:flutter/material.dart" hide AppBar;
import "package:go_router/go_router.dart";
import "package:pawpath/app/counter/counter.dart";
import "package:pawpath/app/features/layout/app_bar/app_bar.dart";
import "package:pawpath/app/features/layout/app_layout/app_layout.dart";
import "package:pawpath/app/features/layout/navigation_bar/navigation_bar.type.dart";
import "package:pawpath/l10n/l10n.dart";

part "router.dart";

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "pawpath",
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      localizationsDelegates: localizationDelegates,
      supportedLocales: locales,
      routerConfig: router,
    );
  }
}
