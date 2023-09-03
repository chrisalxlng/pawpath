part of "app.dart";

String? fullPath;

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/today",
    routes: [
      ShellRoute(
          navigatorKey: _stageNavigatorKey,
          pageBuilder: _defaultLayout,
          routes: [
            GoRoute(
              path: "/today",
              pageBuilder: (context, state) {
                fullPath = state.fullPath;
                return const NoTransitionPage(
                    child: Counter(
                  title: "Today",
                ));
              },
            ),
            GoRoute(
              path: "/history",
              pageBuilder: (context, state) {
                fullPath = state.fullPath;
                return const NoTransitionPage(
                    child: Counter(
                  title: "History",
                ));
              },
            ),
            GoRoute(
              path: "/stats",
              pageBuilder: (context, state) {
                fullPath = state.fullPath;
                return const NoTransitionPage(
                    child: Counter(
                  title: "Stats",
                ));
              },
            ),
            GoRoute(
              path: "/settings",
              pageBuilder: (context, state) {
                fullPath = state.fullPath;
                return const NoTransitionPage(
                    child: Counter(
                  title: "Settings",
                ));
              },
            ),
          ]),
    ]);

ShellRoutePageBuilder _defaultLayout = (context, state, child) {
  late final NavigationDestinationKey activeDestinationKey;

  if (fullPath?.endsWith("/today") ?? false) {
    activeDestinationKey = NavigationDestinationKey.today;
  } else if (fullPath?.endsWith("/history") ?? false) {
    activeDestinationKey = NavigationDestinationKey.history;
  } else if (fullPath?.endsWith("/stats") ?? false) {
    activeDestinationKey = NavigationDestinationKey.stats;
  } else if (fullPath?.endsWith("/settings") ?? false) {
    activeDestinationKey = NavigationDestinationKey.settings;
  }

  return MaterialPage(
      child: AppLayout(
          activeDestinationKey: activeDestinationKey,
          appBar: const AppBar(
            title: "Today",
          ),
          child: child));
};

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> _stageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "stage");
