import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wink_flutter/Providers/router.dart';
import 'package:moonspace/router/shell_data.dart';
import 'package:moonspace/router/tab_shell.dart';
import 'package:wink_flutter/Routes/Home/notifications.dart';

part 'home.g.dart';

class Home {
  static final routes = $appRoutes;
}

@TypedGoRoute<ExitRoute>(
  path: AppRouter.root,
  routes: [
    TypedGoRoute<SettingsRoute>(path: AppRouter.settings),
    TypedGoRoute<AccountRoute>(path: AppRouter.account),

    TypedStatefulShellRoute<NotificationShell>(
      branches: [
        TypedStatefulShellBranch<NotificationShellBranchData>(
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<NotificationsRoute>(
              name: AppRouter.notification,
              path: AppRouter.notification,
            ),
          ],
        ),
        TypedStatefulShellBranch<NotificationShellBranchData>(
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<SubscriptionsRoute>(
              name: AppRouter.subscription,
              path: AppRouter.subscription,
            ),
          ],
        ),
      ],
    ),

    TypedStatefulShellRoute<HomeShellRoute>(
      branches: [
        TypedStatefulShellBranch<HomeShellBranchData>(
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<HomeRoute>(
              name: AppRouter.allchat,
              path: AppRouter.allchat,
              routes: [
                TypedGoRoute<ChatRoute>(
                  path: AppRouter.chat,
                  routes: [
                    TypedGoRoute<ChatInfoRoute>(path: AppRouter.chatInfo),
                  ],
                ),
              ],
            ),
          ],
        ),
        TypedStatefulShellBranch<HomeShellBranchData>(
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<SearchRoute>(
              name: AppRouter.search,
              path: AppRouter.search,
            ),
          ],
        ),
        TypedStatefulShellBranch<HomeShellBranchData>(
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<ProfileRoute>(
              name: AppRouter.profile,
              path: AppRouter.profile,
            ),
          ],
        ),
      ],
    ),
  ],
)
class ExitRoute extends GoRouteData with $ExitRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Exit')));

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return state.uri.path == AppRouter.root
        ? (AppRouter.root + AppRouter.allchat)
        : null;
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Chats')),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          final chatId = 'chat_$index';
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('Dummy Chat $index'),
            subtitle: const Text('Tap to view chat...'),
            onTap: () {
              ChatRoute(chatId: chatId).go(context);
            },
          );
        },
      ),
    );
  }
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Settings')));
}

class AccountRoute extends GoRouteData with $AccountRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Account')));
}

class ChatRoute extends GoRouteData with $ChatRoute {
  final String chatId;
  const ChatRoute({required this.chatId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat $chatId'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              ChatInfoRoute(chatId: chatId).go(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.blue[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Message $index in $chatId'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatInfoRoute extends GoRouteData with $ChatInfoRoute {
  final String chatId;
  const ChatInfoRoute({required this.chatId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Info $chatId')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.group, size: 50)),
            const SizedBox(height: 16),
            Text(
              'Details for $chatId',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchRoute extends GoRouteData with $SearchRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Search')));
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Scaffold(body: Center(child: Text('Profile')));
}

class HomeShellRoute extends StatefulShellRouteData {
  const HomeShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey =
      AppRouter.homeShellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static List<ShellData> data = [
    ShellData(
      name: 'Chat',
      title: 'Wink Flow',
      locations: [AppRouter.allchat],
      icon: const Icon(Icons.chat_bubble_outline),
    ),
    ShellData(
      name: 'Search',
      locations: [AppRouter.search],
      icon: const Icon(Icons.search),
    ),
    ShellData(
      name: 'Profile',
      locations: [AppRouter.profile],
      icon: const Icon(Icons.face_2_outlined),
    ),
  ];

  static List<IconButton> actions(BuildContext context) => [
    IconButton(
      onPressed: () {
        NotificationsRoute().go(context);
      },
      icon: const Icon(
        Icons.notifications_none_outlined,
        semanticLabel: 'Open notifications',
      ),
    ),
    IconButton(
      onPressed: () {
        SettingsRoute().go(context);
      },
      icon: const Icon(Icons.settings, semanticLabel: 'Open settings'),
    ),
  ];

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TabShell(
          navigationShell: navigationShell,
          shellData: data,
          showTabbar: constraints.maxWidth > 600,
          showNavigationBar: false,
          showNavigationRail: constraints.maxWidth <= 600,
          actions: actions(context),
          children: children,
        );
      },
    );
  }
}

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}
