part of "app.dart";

final dogSelectionRoute = GoRoute(
    path: "dog-selection",
    parentNavigatorKey: _rootNavigatorKey,
    pageBuilder: (context, state) {
      fullPath = state.fullPath;
      return const ModalBottomSheetPage(child: DogOverview());
    },
    routes: [
      GoRoute(
        path: "add",
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          fullPath = state.fullPath;
          return const ModalBottomSheetPage(child: DogCreation());
        },
      )
    ]);

String? fullPath;

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/today",
    routes: [
      ShellRoute(pageBuilder: _defaultLayout, routes: [
        GoRoute(
            path: "/today",
            pageBuilder: (context, state) {
              fullPath = state.fullPath;
              return NoTransitionPage(
                  child: GestureDetector(
                onTap: () {},
                child: const Counter(
                  title: "Today",
                ),
              ));
            },
            routes: [dogSelectionRoute]),
        GoRoute(
            path: "/history",
            pageBuilder: (context, state) {
              fullPath = state.fullPath;
              return const NoTransitionPage(
                  child: Counter(
                title: "History",
              ));
            },
            routes: [dogSelectionRoute]),
        GoRoute(
            path: "/stats",
            pageBuilder: (context, state) {
              fullPath = state.fullPath;
              return const NoTransitionPage(
                  child: Counter(
                title: "Stats",
              ));
            },
            routes: [dogSelectionRoute]),
        GoRoute(
            path: "/settings",
            pageBuilder: (context, state) {
              fullPath = state.fullPath;
              return const NoTransitionPage(
                  child: Counter(
                title: "Settings",
              ));
            },
            routes: [dogSelectionRoute]),
      ]),
    ]);

ShellRoutePageBuilder _defaultLayout = (context, state, child) {
  late final NavigationDestinationKey activeDestinationKey;
  late final String title;

  if (fullPath?.endsWith("/today") ?? false) {
    title = S.of(context).navigationDestinationToday;
    activeDestinationKey = NavigationDestinationKey.today;
  } else if (fullPath?.endsWith("/history") ?? false) {
    title = S.of(context).navigationDestinationHistory;
    activeDestinationKey = NavigationDestinationKey.history;
  } else if (fullPath?.endsWith("/stats") ?? false) {
    title = S.of(context).navigationDestinationStats;
    activeDestinationKey = NavigationDestinationKey.stats;
  } else if (fullPath?.endsWith("/settings") ?? false) {
    title = S.of(context).navigationDestinationSettings;
    activeDestinationKey = NavigationDestinationKey.settings;
  } else {
    title = S.of(context).navigationDestinationToday;
    activeDestinationKey = NavigationDestinationKey.today;
  }

  return MaterialPage(
      child: AppLayout(
          activeDestinationKey: activeDestinationKey,
          appBar: HeaderBar(
            title: title,
            action: HeaderBarAction(
                iconData: Icons.swap_horizontal_circle,
                onPressed: () => context.go("$fullPath/dog-selection")),
          ),
          child: child));
};

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
