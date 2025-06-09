import 'package:flutter/material.dart';

double appH(double number) => AppResponsive.height(number);

double appW(double number) => AppResponsive.width(number);

class AppResponsive {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  static double height(double number) => (number / 812) * screenHeight;

  static double width(double number) => (number / 375) * screenWidth;
}
