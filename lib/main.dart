import 'dart:convert';
import 'dart:html' as html;

import 'package:beamer/beamer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/api/api_client.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/locations.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/services/local_storage_service.dart';
import 'package:msof_front/utils/screen_size_util.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

// Must be top-level function
dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

dynamic parseJson(String text) {
  return compute(_parseAndDecode, text);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // URL에 #가 붙을 것인지 안 붙을 것인지
  setPathUrlStrategy();

  // LocalStorageService 초기화
  final localStorageService = LocalStorageService();
  await localStorageService.init();

  final dio = ApiClient.getDefaultDio();
  (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

  html.window.addEventListener('keydown', (event) {
    if (event.runtimeType == html.KeyboardEvent) {
      final keyboardEvent = event as html.KeyboardEvent;
      if (keyboardEvent.metaKey || keyboardEvent.ctrlKey) {
        switch (keyboardEvent.key) {
          case '=': // Prevent zooming in.
          case '-': // Prevent zooming out.
          case 'd': // Prevent bookmark on Firefox e.g.
          case 'g': // Prevent open find on Firefox e.g.
          case 'z': // Prevent restoring tab on Safari.
          case 'u': // Prevent open view-source.
            keyboardEvent.preventDefault();
            break;
        }
      }
    }
  });

  runApp(
    ProviderScope(
      overrides: [
        localStorageServiceProvider.overrideWithValue(localStorageService),
        dioProvider.overrideWithValue(dio),
      ],
      child: MSOF(),
    ),
  );
}

class MSOF extends HookWidget {
  final routerDelegate = BeamerDelegate(
    guards: [
      BeamGuard(
        pathBlueprints: ['/'],
        check: (_, __) => false,
        beamToNamed: Routes.initial,
      ),

      // 유저 정보가 있을 때
      BeamGuard(
        pathBlueprints: Routes.authRoutes,
        check: (context, _) =>
            context.read(authViewModelProvider).isAuthenticated,
        beamToNamed: Routes.login.route,
      ),

      // 유저 정보가 없을 때
      BeamGuard(
        pathBlueprints: Routes.nonAuthRoutes,
        check: (context, _) =>
            !context.read(authViewModelProvider).isAuthenticated,
        beamToNamed: Routes.home.route,
      ),
    ],
    initialPath: Routes.initial,
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        BeamerLocations(),
      ],
    ),
    notFoundRedirectNamed: Routes.notFound.route,
  );

  @override
  Widget build(BuildContext context) {
    // Router에 Auth 정보 제공
    // routeDelegate의 guard에서 check 조건에 따라 routing 제공
    useProvider(authViewModelProvider);

    return BeamerProvider(
      routerDelegate: routerDelegate,
      child: MaterialApp.router(
        shortcuts: (() {
          final shortcuts =
              Map<LogicalKeySet, Intent>.from(WidgetsApp.defaultShortcuts);
          if (kIsWeb) {
            shortcuts.remove(LogicalKeySet(LogicalKeyboardKey.space));
            shortcuts.remove(LogicalKeySet(LogicalKeyboardKey.arrowUp));
            shortcuts.remove(LogicalKeySet(LogicalKeyboardKey.arrowDown));
            shortcuts.remove(LogicalKeySet(LogicalKeyboardKey.arrowLeft));
            shortcuts.remove(LogicalKeySet(LogicalKeyboardKey.arrowRight));
          }
          return shortcuts;
        })(),
        title: 'MutstackOverflow',
        theme: ThemeData(
          textTheme: GoogleFonts.nanumGothicTextTheme(),
          primarySwatch: createMaterialColor(likelionOrangePrimary),
          visualDensity: VisualDensity.adaptivePlatformDensity,
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
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
      ),
    );
  }
}
