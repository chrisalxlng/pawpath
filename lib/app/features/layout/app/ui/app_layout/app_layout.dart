import "package:flutter/cupertino.dart";
import "package:flutter/material.dart" hide NavigationBar;
import "package:flutter/services.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar.type.dart";
import "package:pawpath/app/features/layout/app/ui/navigation_bar/navigation_bar_destination.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/util.dart";

List<NavigationBarDestination> destinations(BuildContext context) => [
      NavigationBarDestination(
          key: const ValueKey(NavigationDestinationKey.today),
          label: S.of(context).navigationDestinationToday,
          icon: CupertinoIcons.today_fill,
          callback: () => context.go("/today")),
      NavigationBarDestination(
          key: const ValueKey(NavigationDestinationKey.history),
          label: S.of(context).navigationDestinationHistory,
          icon: CupertinoIcons.book_fill,
          callback: () => context.go("/history")),
      NavigationBarDestination(
          key: const ValueKey(NavigationDestinationKey.stats),
          label: S.of(context).navigationDestinationStats,
          icon: CupertinoIcons.chart_pie_fill,
          callback: () => context.go("/stats")),
      NavigationBarDestination(
          key: const ValueKey(NavigationDestinationKey.settings),
          label: S.of(context).navigationDestinationSettings,
          icon: CupertinoIcons.gear_alt_fill,
          callback: () => context.go("/settings")),
    ];

class AppLayout extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final NavigationDestinationKey activeDestinationKey;
  final Widget child;

  const AppLayout(
      {super.key,
      required this.appBar,
      required this.activeDestinationKey,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundSecondary(context),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: isLightTheme(context)
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
          child: SafeArea(
              child: Scaffold(
            appBar: appBar,
            bottomNavigationBar: NavigationBar(
                activeDestinationKey: activeDestinationKey,
                destinations: destinations(context)),
            body: child,
          ))),
    );
  }
}
