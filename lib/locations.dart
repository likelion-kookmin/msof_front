import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:msof_front/pages/pages.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/string_extensions.dart';

class BeamerLocations extends BeamLocation {
  BeamerLocations({BeamState? state}) : super(state);

  @override
  List<String> get pathBlueprints => Routes.allRoutes;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      if (state.uri.pathSegments.contains(Routes.notFound))
        BeamPage(
          key: ValueKey(Routes.notFound),
          title: Routes.notFound.capitalizeFirsLetter,
          child: NotFoundPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.login))
        BeamPage(
          key: ValueKey(Routes.login),
          title: Routes.login.capitalizeFirsLetter,
          child: LoginPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.logout))
        BeamPage(
          key: ValueKey(Routes.logout),
          title: Routes.logout.capitalizeFirsLetter,
          child: LogoutPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.signup))
        BeamPage(
          key: ValueKey(Routes.signup),
          title: Routes.signup.capitalizeFirsLetter,
          child: SignupPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.home))
        BeamPage(
          key: ValueKey(Routes.home),
          title: Routes.home.capitalizeFirsLetter,
          child: HomePage(),
        ),
    ];
  }
}
