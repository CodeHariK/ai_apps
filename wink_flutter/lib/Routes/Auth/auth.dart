import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wink_flutter/Providers/router.dart';

part 'auth.g.dart';

class Auth {
  static final routes = $appRoutes;
}

@TypedGoRoute<LoginRoute>(
  path: AppRouter.login,
  routes: [TypedGoRoute<PhoneRoute>(path: AppRouter.phone)],
)
class LoginRoute extends GoRouteData with $LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Login')));
}

class PhoneRoute extends GoRouteData with $PhoneRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Phone')));
}
