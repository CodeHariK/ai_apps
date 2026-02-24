import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wink_flutter/Providers/router.dart';

part 'about.g.dart';

class About {
  static final routes = $appRoutes;
}

@TypedGoRoute<AboutRoute>(path: AppRouter.about)
class AboutRoute extends GoRouteData with $AboutRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('About')));
}
