import 'package:flutter/material.dart';
import 'package:movies_app/core/colors_manager.dart';

class AppTheme{

  static final ThemeData light= ThemeData(
    scaffoldBackgroundColor: ColorsManager.background,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.navigationColor,
      selectedItemColor: ColorsManager.yellow,
      unselectedItemColor: ColorsManager.offWhite,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(),
      unselectedLabelStyle: TextStyle(),
    )

  );
}