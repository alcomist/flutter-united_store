import 'package:flutter/material.dart';
import 'package:united_market/page/user_detail.dart';
import 'package:united_market/route/route.dart';
import 'package:united_market/route/notifier.dart';

import 'package:united_market/page/home.dart';
import 'package:united_market/page/user_select.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final PageNotifier notifier;

  AppRouterDelegate({required this.notifier});

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          if (AppRoute.isUnknown(notifier.pageName))
            const MaterialPage(child: HomePage()),
          if (notifier.pageName == PageNames.home.name)
            const MaterialPage(child: HomePage()),
          if (notifier.pageName == PageNames.userSelect.name)
            const MaterialPage(child: UserSelectPage()),
          if (notifier.pageName == PageNames.userDetail.name)
            const MaterialPage(child: UserDetailPage()),
          //if (notifier.pageName == PageNames.gamePlay.name)
            //const MaterialPage(child: GamePlayPage()),
          //if (notifier.pageName == PageNames.gameResult.name)
            //const MaterialPage(child: GameResultPage()),
        ],
        onPopPage: (route, result) => route.didPop(result));
  }

  //currentConfiguration is called whenever there might be a change in route
  //It checks for the current page or route and return a new route information
  //This is what populates our browser history
  @override
  AppRoute? get currentConfiguration {
    return AppRoute.getInstance(notifier.pageName);
  }

  //This is called whenever the system detects a new route is passed
  //It checks the current route through the configuration and uses that to update the notifier
  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    notifier.changePage(page: configuration.pageName);
  }
}
