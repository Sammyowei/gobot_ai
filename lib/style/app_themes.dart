import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    scaffoldBackgroundColor:
        isDarkTheme ? CustomAppColors.darkMode : CustomAppColors.lightMode,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: isDarkTheme
          ? CustomAppColors.bottomNavDM
          : CustomAppColors.bottomNavLM,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomAppColors.selectedNavItemColor,
      unselectedItemColor: CustomAppColors.bottomNavItemColor,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(
        isDarkTheme
            ? CustomAppColors.primaryColor
            : CustomAppColors.switchColor,
      ),
      thumbColor: MaterialStateProperty.all(
        isDarkTheme
            ? CustomAppColors.boldTextDarkTheme
            : CustomAppColors.boldTextDarkTheme,
      ),
    ),
  );
}
