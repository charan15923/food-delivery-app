import 'package:app_logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import 'app_routes.dart';

final RouteObserver<ModalRoute<dynamic>> routeObserver =
    RouteObserver<ModalRoute<dynamic>>();

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  /// getter for global context
  static BuildContext? get ctx =>
      router.routerDelegate.navigatorKey.currentContext;

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.homeScreen.path,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    observers: [
      routeObserver,
      GoRouterObserver(),
    ],
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen.path,
        name: AppRoutes.homeScreen.name,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
    ],
  );
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.logger.info('GoRouterObserver didPush: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.logger.info('GoRouterObserver didPop: ${route.settings.name}');
  }
}
