import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:msof_front/pages/pages.dart';

class Routes {
  static const String home = '/';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String signup = '/auth/signup';

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }

  static Route onGenerateRoute(RouteSettings settings) {
    return Routes.fadeThrough(
      settings,
      (context) {
        print(settings);
        print(settings.name);
        switch (settings.name) {
          case Routes.home:
            return HomePage();
          case Routes.login:
            return LoginPage();
          default:
            return SizedBox();
        }
      },
    );
  }
}
