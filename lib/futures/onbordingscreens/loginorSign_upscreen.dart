import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/core/approuters/app_routs.dart';
import 'package:wheater_app/core/component/buttons/simple_button.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';

class LoginorsignUpscreen extends StatelessWidget {
  const LoginorsignUpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.7,
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? AppColors.colorwhite
                      : AppColors.darkcolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  MediaQuery.of(context).size.width / 2,
                ),
                bottomRight: Radius.circular(
                  MediaQuery.of(context).size.width / 2,
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 240.w,
            height: 50.h,
            child: SimpleButton(
              onprs: () {
                GoRouter.of(context).push(AppRouts.signin);
              },
              text: AppStrings.login,
              bckgrundclr: AppColors.colorblue,
              txtcolor: AppColors.colorwhite,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 240.w,
            height: 50.h,
            child: SimpleButton(
              onprs: () {
                GoRouter.of(context).push(AppRouts.signup);
              },
              text: AppStrings.signup,
              bckgrundclr: AppColors.colorwhite,
              txtcolor: AppColors.colorblack,
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
