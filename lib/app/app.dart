import "package:flutter/material.dart" hide AppBar;
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/counter/counter.dart";
import "package:pawpath/app/features/dog_selection/ui/dog_creation/dog_creation.dart";
import "package:pawpath/app/features/dog_selection/ui/dog_overview/dog_overview.dart";
import "package:pawpath/app/features/layout/app/ui/app_layout/app_layout.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar.type.dart";
import "package:pawpath/app/features/layout/modal_sheet/modal_sheet_page.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.type.dart";
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
