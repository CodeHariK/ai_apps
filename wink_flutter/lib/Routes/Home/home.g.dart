// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$exitRoute];

RouteBase get $exitRoute => GoRouteData.$route(
  path: '/',
  factory: $ExitRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'settings', factory: $SettingsRoute._fromState),
    GoRouteData.$route(path: 'account', factory: $AccountRoute._fromState),
    StatefulShellRouteData.$route(
      navigatorContainerBuilder: NotificationShell.$navigatorContainerBuilder,
      factory: $NotificationShellExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: 'notification',
              name: 'notification',
              factory: $NotificationsRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: 'subscription',
              name: 'subscription',
              factory: $SubscriptionsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellRouteData.$route(
      navigatorContainerBuilder: HomeShellRoute.$navigatorContainerBuilder,
      factory: $HomeShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: 'chat',
              name: 'chat',
              factory: $HomeRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':chatId',
                  factory: $ChatRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'info',
                      factory: $ChatInfoRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: 'search',
              name: 'search',
              factory: $SearchRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: 'profile',
              name: 'profile',
              factory: $ProfileRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

mixin $ExitRoute on GoRouteData {
  static ExitRoute _fromState(GoRouterState state) => ExitRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AccountRoute on GoRouteData {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute();

  @override
  String get location => GoRouteData.$location('/account');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationShellExtension on NotificationShell {
  static NotificationShell _fromState(GoRouterState state) =>
      const NotificationShell();
}

mixin $NotificationsRoute on GoRouteData {
  static NotificationsRoute _fromState(GoRouterState state) =>
      NotificationsRoute();

  @override
  String get location => GoRouteData.$location('/notification');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SubscriptionsRoute on GoRouteData {
  static SubscriptionsRoute _fromState(GoRouterState state) =>
      SubscriptionsRoute();

  @override
  String get location => GoRouteData.$location('/subscription');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) =>
      const HomeShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  @override
  String get location => GoRouteData.$location('/chat');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChatRoute on GoRouteData {
  static ChatRoute _fromState(GoRouterState state) =>
      ChatRoute(chatId: state.pathParameters['chatId']!);

  ChatRoute get _self => this as ChatRoute;

  @override
  String get location =>
      GoRouteData.$location('/chat/${Uri.encodeComponent(_self.chatId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChatInfoRoute on GoRouteData {
  static ChatInfoRoute _fromState(GoRouterState state) =>
      ChatInfoRoute(chatId: state.pathParameters['chatId']!);

  ChatInfoRoute get _self => this as ChatInfoRoute;

  @override
  String get location =>
      GoRouteData.$location('/chat/${Uri.encodeComponent(_self.chatId)}/info');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SearchRoute on GoRouteData {
  static SearchRoute _fromState(GoRouterState state) => SearchRoute();

  @override
  String get location => GoRouteData.$location('/search');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
