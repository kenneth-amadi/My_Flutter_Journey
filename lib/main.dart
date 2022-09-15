import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'browser/browser_home.dart';
import 'route/browser.dart';
import 'route/hm.dart';
import 'shopping/shop_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then(appCallback);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "My Shopping App",
      theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      shortcuts: {
        ...WidgetsApp.defaultShortcuts,
        const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      localizationsDelegates: const [
        //GlobalMaterialLocalizations.delegate,
      ],
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      route('/', const BrowserHome()),
      route('/shop', const ShopHome()),
      route('/hm', const MyHomePage()),
      routeB('/browser'),
    ],
    errorBuilder: (context, state) => Browser(url: state.error.toString()),
  );
}

GoRoute route(String path, Widget route) {
  return GoRoute(
    path: path,
    builder: (BuildContext context, GoRouterState state) {
      return route;
    },
  );
}

GoRoute routeB(String path) {
  return GoRoute(
    path: path,
    builder: (BuildContext context, GoRouterState state) {
      return Browser(url: state.extra! as String);
    },
  );
}

launch(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).push(route, extra: extra);
}

FutureOr appCallback(void value) {
  runApp(MyApp());
}

/*initialRoute: Routes.home,
onGenerateRoute: Routes.generate,*/
