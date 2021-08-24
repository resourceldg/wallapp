import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0x6665308a);
  static const Color loginGradientEnd = Color(0x6665308a);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blackFirst = Color(0x11101010);
  static const Color blackMid = Color(0x22202020);
  static const Color blackSoft = Color(0x55515151);
  static const Color blackLight = Color(0x77717171);


  static const Color firstBlack = Color(0x44481532);
  static const Color firstMidd = Color(0x6665308a);
  static const Color firstLight = Color(0xddd4dfe9);
  static const Color yellowBlack = Color(0xddd69a42);
  static const Color yellowMidd = Color(0x6665308a);
  static const Color yellowLight = Color(0xddd4dfe9);



  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
