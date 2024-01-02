import 'package:flutter/material.dart';

class ScreenSize {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }
}
