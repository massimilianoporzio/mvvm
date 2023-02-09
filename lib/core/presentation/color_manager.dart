import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xFFED9728);
  static const Color darkGrey = Color(0xFF525252);
  static const Color grey = Color(0xFF737477);
  static const Color lightGrey = Color(0xFF9E9E9E);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", ""); //*replace # with empty
    if (hexColorString.length == 6) {
      //*NO OPACITY ONLY RGB
      hexColorString = "FF$hexColorString"; //*messo opacity a 100
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
