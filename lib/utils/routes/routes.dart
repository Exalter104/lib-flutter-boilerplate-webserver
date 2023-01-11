import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_webserver/utils/routes/routes_name.dart';
import 'package:flutter_boilerplate_webserver/view/home_view.dart';
import 'package:flutter_boilerplate_webserver/view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final argums = settings.arguments;
    switch (settings.name) {

// navigation to home screen
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
// navigation to login screen
      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
// if no routes are defined
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
                child: Text(
              "No Routes is defined",
              style: TextStyle(color: Colors.red, fontSize: 24),
            )),
          );
        });
    }
  }
}
