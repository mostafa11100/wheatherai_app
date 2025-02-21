import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

Widget customappBar({required String name, required context}) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 0),
    title: Text(
      AppStrings.hello,
      style: TextstyleConst.texts25.copyWith(
        height: 1,
        color: Theme.of(context).colorScheme.onSecondary,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.3,
      ),
    ),
    dense: true,
    subtitle: Text(name, style: TextstyleConst.texts22),
    trailing: Icon(Icons.menu_outlined, size: 45.r),
    isThreeLine: true,
  );
}
