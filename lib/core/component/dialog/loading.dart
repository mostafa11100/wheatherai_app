import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

showloadingdialog(BuildContext context) {
  Future.delayed(Duration(milliseconds: 600), () {
    context.pop();
  });
  showDialog(
    barrierDismissible: false,

    context: context,
    builder: (context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorblack,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 130.h,
          width: 125.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: AppColors.colorwhite),
              SizedBox(height: 20.h),
              Text(AppStrings.loading, style: TextstyleConst.texts15),
            ],
          ),
        ),
      );
    },
  );
}

showsuccess(ok, context, message) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.rightSlide,
    title: "Success",
    desc: message,

    btnOkOnPress: ok,
  ).show();
}
