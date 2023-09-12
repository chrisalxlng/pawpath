import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/dog_selection/modal_sheets/dog_creation.dart";
import "package:pawpath/app/features/dog_selection/modal_sheets/dog_overview.dart";
import "package:pawpath/app/features/dog_walk/modal_sheets/dog_walk.dart";
import "package:pawpath/app/features/layout/app/ui/app_layout/app_layout.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar.type.dart";
import "package:pawpath/app/features/layout/modal_sheet/modal_sheet_page.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.type.dart";
import "package:pawpath/l10n/l10n.dart";
import "package:shared_preferences/shared_preferences.dart";

part "router.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final sharedPreferencesOverride =
      sharedPreferencesProvider.overrideWithValue(sharedPreferences);
  runApp(ProviderScope(
      overrides: [sharedPreferencesOverride], child: const App()));
}

final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  throw UnimplementedError();
});

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
