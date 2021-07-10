import 'package:msof_front/utils/string_extensions.dart';

class Routes {
  static const String home = 'home';
  static const String login = 'login';
  static const String logout = 'logout';
  static const String signup = 'signup';
  static const String notFound = '404';
  static const String initial = home;

  static List<String> allRoutes = [
    home.route,
    login.route,
    logout.route,
    signup.route,
    notFound.route,
  ];

  static List<String> nonAuthRoutes = [
    login.route,
    signup.route,
    notFound.route,
  ];

  static List<String> get authRoutes =>
      allRoutes.where((route) => !nonAuthRoutes.contains(route)).toList();

  // static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
  //     {int duration = 300}) {
  //   return PageRouteBuilder<T>(
  //     settings: settings,
  //     transitionDuration: Duration(milliseconds: duration),
  //     pageBuilder: (context, animation, secondaryAnimation) => page(context),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return FadeScaleTransition(animation: animation, child: child);
  //     },
  //   );
  // }
}
