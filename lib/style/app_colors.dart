import 'package:flutter/material.dart';

class CustomAppColors {
// App background theming

  static Color darkMode = const Color(0xff1D1D1D);
  static Color lightMode = const Color(0xffFFFFFF);

  // General App Colors

  static Color primaryColor = const Color(0xffFF3E3F);
  static Color boldTextDarkTheme = const Color(0xffFFFFFF);
  static Color boldTextLightTheme = const Color(0xff000000);
  static Color bottonTextColor = const Color(0xffFFFFFF);
  static Color chatTimeColorDM = const Color(0xffFFFFFF).withOpacity(0.6);
  static Color chatTimeColorLM = const Color(0xff000000).withOpacity(0.6);

  static Color bottomNavLM = const Color(0xffF4F4F4);
  static Color bottomNavDM = const Color(0xffFCFCFC).withOpacity(0.2);
  static Color bottomNavItemColor = const Color(0xffAFAFAF);
  static Color get selectedNavItemColor => primaryColor;
  static Color get switchColor => bottomNavItemColor;
  static Color get versionNameColorLM => bottomNavItemColor;

  static Color get textFieldColor => bottomNavItemColor.withOpacity(0.30);

  static Color get hintTextColorLM => boldTextLightTheme.withOpacity(.5);
  static Color get hintTextColorDM => boldTextDarkTheme.withOpacity(.5);
  static Color get buttonColor => bottomNavItemColor.withOpacity(.2);
  static Color borderColor = const Color(0xff3D3D3D).withOpacity(.2);
  static Color get buttonColorDm => boldTextDarkTheme.withOpacity(.7);
  static Color get buttonColorLm => boldTextLightTheme.withOpacity(.7);
}
