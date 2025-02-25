import 'package:flutter/material.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';

class Thems {
  static ThemeData lighttheme() {
    return ThemeData(
      primaryColor: AppColors.colorwhite,
      // primaryColorLight: ,
      scaffoldBackgroundColor: AppColors.colorwhite,

      fontFamily: "Prompt",
      brightness: Brightness.light,

      //add more
    );
  }

  static ThemeData darktheme() {
    return ThemeData(
      primaryColor: AppColors.darkcolor,
      scaffoldBackgroundColor: AppColors.darkcolor,
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkcolor,
        onPrimary: AppColors.darkcolorlight,
        secondary: AppColors.colorblue,
        onSecondary: AppColors.colorblue2,
      ),
      fontFamily: "Prompt",
      brightness: Brightness.dark,
      primaryColorLight: AppColors.darkcolorlight,
      //add more
    );
  }
}
