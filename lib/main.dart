import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/screen_size_util.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(
    ProviderScope(
      child: MSOF(),
    ),
  );
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
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
