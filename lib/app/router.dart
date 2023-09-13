part of "app.dart";

final dogsRoute = GoRoute(
    path: "dogs",
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
          return const ModalBottomSheetPage(child: AddDog());
        },
      ),
      GoRoute(
        path: "edit/:id",
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          fullPath = state.fullPath;
          final id = state.pathParameters["id"];
          if (id == null) {
            debugPrint("Id missing.");
            // TODO: Create error page
            return const NoTransitionPage(child: Text("Id missing."));
          } else {
            return ModalBottomSheetPage(child: EditDog(id: id));
          }
        },
      )
    ]);

final dogWalkRoute = GoRoute(
    path: "dog-walk",
    parentNavigatorKey: _rootNavigatorKey,
    pageBuilder: (context, state) {
      fullPath = state.fullPath;
      return const ModalBottomSheetPage(child: DogWalk());
    });

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
              return const NoTransitionPage(child: Text("Today"));
            },
            routes: [dogsRoute, dogWalkRoute]),
        GoRoute(
            path: "/history",
            pageBuilder: (context, state) {
              fullPath = state.fullPath;
              return const NoTransitionPage(child: Text("History"));
            },
            routes: [dogsRoute, dogWalkRoute]),
        GoRoute(
            path: "/stats",
            pageBuilder: (context, state) {
              fullPath = state.fullPath;
              return const NoTransitionPage(child: Text("Stats"));
            },
            routes: [dogsRoute, dogWalkRoute]),
        GoRoute(
            path: "/settings",
            pageBuilder: (context, state) {
              fullPath = state.fullPath;
              return const NoTransitionPage(child: Text("Settings"));
            },
            routes: [dogsRoute, dogWalkRoute]),
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
                onPressed: () => context.go("$fullPath/dogs")),
          ),
          child: child));
};

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
