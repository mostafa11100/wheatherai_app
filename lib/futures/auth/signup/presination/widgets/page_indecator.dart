import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';

Widget pageindecator(index, context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (i) {
        return AnimatedContainer(
          margin: EdgeInsets.all(5),
          height: 12.h,
          width: 12.w,
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? (i == index
                        ? AppColors.colorwhite
                        : AppColors.darkcolorlight)
                    : (i != index
                        ? AppColors.darkcolorlight
                        : AppColors.darkcolor), //for app theme
            shape: BoxShape.circle,
          ),
        );
      }),
    ),
  );
}
