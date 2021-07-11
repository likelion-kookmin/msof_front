import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import 'package:msof_front/utils/string_extensions.dart';

class RouteUtils {
  static void toNamed(BuildContext context, String routeName) {
    return Beamer.of(context).beamToNamed(routeName.route);
  }
}
