extension CapExtension on String {
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get capitalizeFirsLetter => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.inCaps)
      .join(' ');
}

extension RouteNameToRoute on String {
  String get route => '/$this';
}
