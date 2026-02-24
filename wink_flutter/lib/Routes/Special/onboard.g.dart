// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$onboardRoute];

RouteBase get $onboardRoute =>
    GoRouteData.$route(path: '/onboard', factory: $OnboardRoute._fromState);

mixin $OnboardRoute on GoRouteData {
  static OnboardRoute _fromState(GoRouterState state) => OnboardRoute();

  @override
  String get location => GoRouteData.$location('/onboard');

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
