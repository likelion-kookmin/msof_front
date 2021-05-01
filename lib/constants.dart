import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Flavor { development, production }

@immutable
class Constants {
  const Constants({
    required this.baseApiUrl,
  });

  factory Constants.of() {
    if (_instance != null) return _instance!;

    final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    );

    switch (flavor) {
      case Flavor.development:
        _instance = Constants._dev();
        break;
      case Flavor.production:
      default:
        _instance = Constants._prd();
    }
    return _instance!;
  }

  factory Constants._dev() {
    return const Constants(
      baseApiUrl: 'http://localhost',
    );
  }

  factory Constants._prd() {
    return const Constants(
      baseApiUrl: 'http://54.65.162.242',
    );
  }

  // Constants instance
  static Constants? _instance;

  // AppbarTitle
  static const String appBarTitle = 'MutstackOverflow';

  final String baseApiUrl;
}
