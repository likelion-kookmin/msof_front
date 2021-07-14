import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:msof_front/pages/pages.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/logger.dart';

class BeamerLocations extends BeamLocation {
  BeamerLocations({BeamState? state}) : super(state);

  @override
  List<String> get pathBlueprints => Routes.allRoutes;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    logger.d('${state.uri.pathSegments}, ${state.pathParameters}');
    return [
      if (state.uri.pathSegments.contains(Routes.notFound))
        BeamPage(
          key: ValueKey(Routes.notFound),
          title: Routes.getRouteInfoByRouteName(Routes.notFound).title,
          child: NotFoundPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.login))
        BeamPage(
          key: ValueKey(Routes.login),
          title: Routes.getRouteInfoByRouteName(Routes.login).title,
          child: LoginPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.logout))
        BeamPage(
          key: ValueKey(Routes.logout),
          title: Routes.getRouteInfoByRouteName(Routes.logout).title,
          child: LogoutPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.signup))
        BeamPage(
          key: ValueKey(Routes.signup),
          title: Routes.getRouteInfoByRouteName(Routes.signup).title,
          child: SignupPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.home))
        BeamPage(
          key: ValueKey(Routes.home),
          title: Routes.getRouteInfoByRouteName(Routes.home).title,
          child: HomePage(),
        ),
    ];
  }
}
