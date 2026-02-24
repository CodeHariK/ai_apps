import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wink_flutter/Providers/router.dart';

part 'onboard.g.dart';

class Onboard {
  static final routes = $appRoutes;
}

@TypedGoRoute<OnboardRoute>(path: AppRouter.onboard)
class OnboardRoute extends GoRouteData with $OnboardRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Onboard')));
}
