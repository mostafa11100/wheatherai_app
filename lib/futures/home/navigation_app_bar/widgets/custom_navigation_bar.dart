import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<TabItem> items = [
    TabItem(icon: Icons.star_border_outlined, title: 'Stars'),
    TabItem(icon: Icons.person_2_outlined, title: 'Shop'),
    TabItem(icon: Icons.home_outlined, title: 'Home'),
    TabItem(icon: Icons.check_box_outlined, title: 'Check'),
    TabItem(icon: Icons.settings_outlined, title: 'Setting'),
  ];

  int selected = 2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 20.w),
      child: BottomBarFloating(
        enableShadow: false,
        titleStyle: TextstyleConst.texts10,
        borderRadius: BorderRadius.circular(23.r),
        items: items,
        iconSize: 28.r,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        color: Colors.white,
        colorSelected: Colors.white,

        indexSelected: selected,
        onTap:
            (int index) => setState(() {
              selected = index;
            }),
      ),
    );
  }
}
