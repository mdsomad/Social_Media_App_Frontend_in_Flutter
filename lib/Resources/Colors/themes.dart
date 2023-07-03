import 'package:flutter/material.dart';



class AppColors {
  static Color accent = const Color(0xff1ab7c3);
  static Color text = const Color(0xff212121);
  static Color textLight = const Color(0xff8a8a8a);
  static Color white = const Color(0xffffffff);
}




class Themes {

  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.text
      ),

      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.text
      )
    ),
    
    colorScheme: ColorScheme.light(
      primary: AppColors.accent,
      secondary: AppColors.accent
    )
  );

}
