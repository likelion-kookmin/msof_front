import 'package:msof_front/utils/string_extensions.dart';

enum RouteType {
  auth,
  nonAuth,
  category,
}

class RouteInfo {
  final String title;
  final String? route;
  final RouteType type;

  RouteInfo({
    required this.title,
    this.route,
    this.type = RouteType.auth,
  });
}

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

  static final List<RouteInfo> _routeInfos = [
    RouteInfo(title: 'Home', route: home),
    RouteInfo(title: 'Account', type: RouteType.category),
    RouteInfo(title: 'Sign in', type: RouteType.nonAuth, route: login),
    RouteInfo(title: 'Sign up', type: RouteType.nonAuth, route: signup),
    RouteInfo(title: 'Sign out', route: logout),
  ];

  static List<RouteInfo> getRouteInfos(bool isAuthenticated) {
    return _routeInfos
        .where((routeInfo) => isAuthenticated
            ? routeInfo.type != RouteType.nonAuth
            : routeInfo.type != RouteType.auth)
        .toList();
  }

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
