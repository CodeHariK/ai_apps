import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wink_flutter/Providers/router.dart';
import 'package:moonspace/router/shell_data.dart';
import 'package:moonspace/router/tab_shell.dart';
import 'package:wink_flutter/Routes/Home/home.dart';

// part 'notifications.g.dart';

// class Notifications {
//   static final routes = $appRoutes;
// }

final GlobalKey<NavigatorState> notificationShellNavigatorKey =
    GlobalKey<NavigatorState>();

class NotificationShell extends StatefulShellRouteData {
  const NotificationShell();

  static final GlobalKey<NavigatorState> $navigatorKey =
      notificationShellNavigatorKey;

  static List<ShellData> data = [
    ShellData(
      name: 'Notification',
      locations: [AppRouter.notification],
      icon: const Icon(Icons.notifications_none_rounded),
    ),
    ShellData(
      name: 'Subscription',
      locations: [AppRouter.subscription],
      icon: const Icon(Icons.subject_sharp),
    ),
  ];

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return TabShell(
      navigationShell: navigationShell,
      shellData: NotificationShell.data,
      canPop: BackButton(
        onPressed: () {
          HomeRoute().go(context);
        },
      ),
      showTabbar: true,
      showNavigationBar: false,
      children: children,
    );
  }
}

class NotificationShellBranchData extends StatefulShellBranchData {
  const NotificationShellBranchData();
}

class NotificationsRoute extends GoRouteData with $NotificationsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Dummy Notification $index'),
            subtitle: const Text('Someone liked your message'),
          );
        },
      ),
    );
  }
}

class SubscriptionsRoute extends GoRouteData with $SubscriptionsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscriptions')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.subject),
            title: Text('Dummy Subscription $index'),
            subtitle: const Text('New content available'),
          );
        },
      ),
    );
  }
}
