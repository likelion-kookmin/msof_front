import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/services/local_storage_service.dart';
import 'package:msof_front/utils/screen_size_util.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // URL에 #가 붙을 것인지 안 붙을 것인지
  setHashUrlStrategy();

  // LocalStorageService 초기화
  final localStorageService = LocalStorageService();
  await localStorageService.init();

  runApp(
    ProviderScope(
      overrides: [
        localStorageServiceProvider.overrideWithValue(localStorageService),
      ],
      observers: [Logger()],
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
        textTheme: GoogleFonts.nanumGothicTextTheme(),
        primaryColor: likelionOrangePrimary,
        primaryIconTheme: IconThemeData(color: textColor),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: ScreenSizeUtil.fullhd,
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
