import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:msof_front/utils/logger.dart';

extension RouteStringExtension on String {
  String get route => '/$this';
  String get pathParameterId => '${this}Id';
}

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

  // generic CRUD routes
  static const String create = 'create';
  static const String update = 'update';

  // questions
  static final String question = 'questions';
  static final String questionCreate = '$question/$create';
  static final String questionDetail = '$question/:${question.pathParameterId}';
  static final String questionList = '$question';
  static final String questionUpdate =
      '$question/:${question.pathParameterId}/$update';

  static List<String> allRoutes = [
    home.route,
    login.route,
    logout.route,
    signup.route,
    notFound.route,

    // questions
    questionCreate.route,
    questionDetail.route,
    questionList.route,
    questionUpdate.route,
  ];

  static List<String> nonAuthRoutes = [
    login.route,
    signup.route,
    notFound.route,
  ];

  static List<String> get authRoutes =>
      allRoutes.where((route) => !nonAuthRoutes.contains(route)).toList();

  /// Navigate methods
  static void toNamed(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? pathParameters,
    bool replaceCurrent = false,
  }) {
    var route = routeName.route;
    if (pathParameters != null) {
      for (var item in pathParameters.entries) {
        route = route.replaceFirst(':${item.key}', '${item.value}');
      }
    }
    logger.d('toNamed $route, data: $data');
    return Beamer.of(context).beamToNamed(
      route,
      data: data,
      replaceCurrent: replaceCurrent,
    );
  }

  static bool back(BuildContext context) {
    logger.d('back');
    return Beamer.of(context).beamBack();
  }

  /// Route info
  static final List<RouteInfo> _routeInfos = [
    RouteInfo(title: 'Home', route: home),

    // account
    RouteInfo(title: 'Account', type: RouteType.category),
    RouteInfo(title: 'Sign in', type: RouteType.nonAuth, route: login),
    RouteInfo(title: 'Sign up', type: RouteType.nonAuth, route: signup),
    RouteInfo(title: 'Sign out', route: logout),

    // question
    RouteInfo(title: 'Question', type: RouteType.category),
    RouteInfo(title: 'Question list', route: questionList),
  ];

  static List<RouteInfo> getRouteInfosByIsAuthenticated(bool isAuthenticated) {
    return _routeInfos
        .where((routeInfo) => isAuthenticated
            ? routeInfo.type != RouteType.nonAuth
            : routeInfo.type != RouteType.auth)
        .toList();
  }

  static RouteInfo getRouteInfoByRouteName(String routeName) {
    return _routeInfos.firstWhere((element) => routeName == element.route);
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
