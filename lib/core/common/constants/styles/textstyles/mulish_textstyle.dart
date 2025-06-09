import 'package:lingua_story/core/common/constants/strings/app_fonts.dart';
import 'package:lingua_story/core/utils/app_responsive.dart';

import 'app_textstyles.dart';
import 'package:flutter/material.dart';

class MulishTextStyles extends AppTextStyles {
  @override
  TextStyle bold({required Color color, required double fontSize}) => TextStyle(
    fontSize: AppResponsive.height(fontSize),
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.mulish,
  );

  @override
  TextStyle semiBold({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsive.height(fontSize),
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.mulish,
      );

  @override
  TextStyle medium({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsive.height(fontSize),
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.mulish,
      );

  @override
  TextStyle regular({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: AppResponsive.height(fontSize),
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mulish,
      );
}
