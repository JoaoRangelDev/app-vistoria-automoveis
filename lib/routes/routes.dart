import 'package:flutter/material.dart';
import '../pages/home/home.dart';
import 'constante_routes.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
  <String, WidgetBuilder>{
    HOME_PAGE_ROUTE: (_) => const HomePage(),
  };

  static String initial = HOME_PAGE_ROUTE;
  static String login = HOME_PAGE_ROUTE;
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState to = Routes.navigatorKey!.currentState!;
}
