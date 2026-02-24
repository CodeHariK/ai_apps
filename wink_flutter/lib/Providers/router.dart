import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wink_flutter/Providers/auth.dart';
import 'package:wink_flutter/Providers/user_data.dart';
import 'package:wink_flutter/Routes/Auth/auth.dart';
import 'package:wink_flutter/Routes/Home/home.dart';
import 'package:wink_flutter/Routes/Special/about.dart';
import 'package:wink_flutter/Routes/Special/onboard.dart';

part 'router.g.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> homeShellNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String routerRestorationScopeId = 'WinkRouterRestorationScopeId';

  /*-------------------Auth-------------------*/
  static const String login = '/auth/login';
  static const String phone = '/auth/phone';

  /*-------------------Root-------------------*/
  static const String root = '/';
  /*-*/
  static const String account = 'account';
  /*-*/
  static const String settings = 'settings';
  /*-----------------HomeShell-----------------*/
  /*---*/
  static const String allchat = 'chat';
  /*------*/
  static const String chat = ':chatId';
  /*---------*/
  static const String chatInfo = 'info';
  /*---*/
  static const String search = 'search';
  /*---*/
  static const String profile = 'profile';

  /*-----------------Special-----------------*/
  static const String onboard = '/onboard';
  static const String about = '/about';
}

final ValueNotifier<RoutingConfig> winkRouterConfigNotifier =
    ValueNotifier<RoutingConfig>(
      _generateRoutingConfig(authenticated: false, onboarded: false),
    );

GoRouter winkRouter(GlobalKey<NavigatorState> electricNavigatorKey) =>
    GoRouter.routingConfig(
      navigatorKey: electricNavigatorKey,
      routingConfig: winkRouterConfigNotifier,
      initialLocation: AppRouter.onboard,
      debugLogDiagnostics: true,
      restorationScopeId: AppRouter.routerRestorationScopeId,
    );

RoutingConfig _generateRoutingConfig({
  required bool authenticated,
  required bool onboarded,
}) {
  return RoutingConfig(
    redirectLimit: 100,
    redirect: (context, state) async {
      debugPrint(
        '-> -> -> ${state.uri} auth:$authenticated onboard:$onboarded}',
      );

      final isAuthRoute = state.matchedLocation.startsWith('/auth');

      if (!onboarded) return AppRouter.onboard;
      if (state.matchedLocation == AppRouter.onboard) {
        return authenticated ? AppRouter.root : AppRouter.login;
      }

      if (!authenticated && !isAuthRoute) return AppRouter.login;
      if (!authenticated && isAuthRoute) return null;
      if (authenticated && isAuthRoute) return AppRouter.root;
      if (authenticated && !isAuthRoute) return null;

      return null;
    },
    routes: <RouteBase>[
      if (authenticated) ...Home.routes,
      if (!authenticated) ...Auth.routes,
      if (!onboarded) ...Onboard.routes,
      ...About.routes,
    ],
  );
}

@Riverpod(keepAlive: true)
Future routerRedirector(Ref ref) async {
  final onboarded = ref.watch(onboardedProvider);
  final user = ref.watch(currentUserProvider).value;
  final userData = ref.watch(currentUserDataProvider).value;

  debugPrint('routerRedirector : $user $userData $onboarded');

  winkRouterConfigNotifier.value = _generateRoutingConfig(
    authenticated: user != null && userData != null,
    onboarded: onboarded,
  );
}
