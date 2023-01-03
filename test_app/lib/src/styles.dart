import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static List<Color> colors = const [
    Color(0xff4D8EFF),
    Color(0xffCDC1FF),
    Color(0xff7AE582),
    Color(0xff81CCF2),
    Color(0xff77EDD9)
  ];
  static Color categoryBorder = const Color(0xffEBEBEB);
  static Color categoryBackground = const Color(0xffFFFEFC);
  static Color categoryActive = const Color(0xff211F1F);
  static Color categoryTextActive = const Color(0xffFFFEFC);
  static Color black = const Color(0xff000000);
  static Color bottomPanel = const Color(0xff211F1F);
  static Color bottomPanelButton = const Color(0xffCDC1FF);
}

class AppStyles {
  static TextStyle s24w500 =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.w500);
  static TextStyle s14w500 =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle s18w500 =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle s14w400 =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}
