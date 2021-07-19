import 'package:flutter/material.dart';

import 'utils/hex_color.dart';

Color likelionOrangePrimary = HexColor('#FF9E1B');
Color likelionOrange = HexColor('#FF9E1B').withOpacity(0.82);
Color blueGray300 = Colors.blueGrey.shade300;

Color sideColor = Color(0xFFF5F5F5);

Color backgroundColor = Colors.white;
Color textColor = Colors.black87;

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
