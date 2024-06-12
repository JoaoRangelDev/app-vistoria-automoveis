import 'package:app_vistoria_automoveis/pages/formulario/form_screen.dart';
import 'package:app_vistoria_automoveis/pages/visualizar/view_form_screen.dart';
import 'package:flutter/material.dart';
import '../pages/home/home_screen.dart';
import 'constante_routes.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
  <String, WidgetBuilder>{
    HOME_PAGE_ROUTE: (_) => const HomePage(),
    FORM_PAGE_ROUTE: (_) => const FormPage(),
    VIEW_FORM_PAGE_ROUTE: (_) => const ViewFormPage()
  };

  static String home = HOME_PAGE_ROUTE;
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState to = Routes.navigatorKey!.currentState!;
}
