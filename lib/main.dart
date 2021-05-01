import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/pages/auth/login.dart';
import 'package:msof_front/pages/home/home_page.dart';
import 'package:msof_front/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MSOF());
}

class MSOF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MutstackOverflow',
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
        background: Container(color: sideColor),
      ),
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(
          settings,
          (context) {
            switch (settings.name) {
              case Routes.home:
                return HomePage();
              case Routes.login:
                return LoginPage();
              default:
                return SizedBox.shrink();
            }
          },
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
