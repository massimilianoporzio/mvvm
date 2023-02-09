import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xFFED9728);
  static const Color darkGrey = Color(0xFF525252);
  static const Color grey = Color(0xFF737477);
  static const Color lightGrey = Color(0xFF9E9E9E);
  static const Color primaryOpacity70 = Color(0xB3ED9728);

  static const Color darkPrimary = Color(0xFFD17D11);
  static const Color grey1 = Color(0xFF707070);
  static const Color grey2 = Color(0xFF797979);
  static const Color white = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFE61F34);
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
