import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/core/approuters/app_routs.dart';
import 'package:wheater_app/core/component/buttons/simple_button.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/core/utilis/assets.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                tileMode: TileMode.clamp,
                begin: Alignment.bottomCenter,
                end: Alignment.centerLeft,
                colors: [Colors.transparent, Colors.white],
                stops: [0.38, 1],
              ).createShader(bounds);
            },

            child: Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                // color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(onpordingimage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 22.h,
            right: 22.w,
            child: SimpleButton(
              bckgrundclr: AppColors.colorwhite,
              onprs: () {
                GoRouter.of(context).push(AppRouts.loginorsignup);
              },
              text: AppStrings.skip,
              txtcolor: AppColors.colorblack,
            ),
          ),
        ],
      ),
    );
  }
}
