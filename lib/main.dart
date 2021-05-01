import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/pages/auth/login.dart';
import 'package:msof_front/pages/home/home_page.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/screen_size_util.dart';
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
        primaryColor: likelionOrangePrimary,
        primaryIconTheme: IconThemeData(color: textColor),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: ScreenSizeUtil.desktop,
        minWidth: ScreenSizeUtil.mobile,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(ScreenSizeUtil.mobile),
          ResponsiveBreakpoint.autoScale(ScreenSizeUtil.tablet),
          ResponsiveBreakpoint.autoScale(ScreenSizeUtil.desktop),
          ResponsiveBreakpoint.resize(ScreenSizeUtil.widescreen),
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
