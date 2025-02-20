import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/futures/home/app_home/presintaion/screens/home_screen.dart';
import 'package:wheater_app/futures/home/navigation_app_bar/widgets/custom_appBar.dart';
import 'package:wheater_app/futures/home/navigation_app_bar/widgets/custom_navigation_bar.dart';

class NavigationBarAppScreen extends StatelessWidget {
  const NavigationBarAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomNavigationBar(),
      body: Container(
        padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.colorwhitetransparnt, Colors.transparent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customappBar(name: "Mostafa Salem", context: context),
            SizedBox(height: 10.h),

            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
