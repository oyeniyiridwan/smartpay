import 'package:flutter/material.dart';
import 'package:smart_pay/utils/constants/colors.dart';

class AppStyles {
  ///TextStyles
  static TextStyle mainTextBold(double fontSize) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: AppColors.primaryColor);
  }

  static TextStyle mainTextNormal(double fontSize) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
        color: AppColors.semiPrimaryColor);
  }

  static TextStyle secondaryTextNormal(double fontSize) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
        color: AppColors.secondaryColor.withOpacity(0.6));
  }

  static TextStyle secondaryTextBold(double fontSize) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: AppColors.secondaryColor.withOpacity(0.6));
  }

  static TextStyle whiteTextBold({double? fontSize}) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: AppColors.whiteColor);
  }
}
