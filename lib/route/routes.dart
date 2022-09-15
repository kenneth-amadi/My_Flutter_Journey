import 'package:flutter/material.dart';

import '../browser/browser_home.dart';
import '../shopping/shop_home.dart';
import 'hm.dart';

class Routes {
  static const String home = "/";
  static const String shop = "/shop";
  static const String hm = "/hm";

  Routes._();

  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return route(const BrowserHome());

      case "/shop":
        return route(const ShopHome());

      case "/hm":
        return route(const MyHomePage());

      default:
        throw const FormatException("Route Not Found!");
    }
  }
}

MaterialPageRoute<dynamic>? route(Widget route) => MaterialPageRoute(builder: (context) => route);

//launch(BuildContext context, String routes) => Navigator.pushNamed(context, routes);

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}
