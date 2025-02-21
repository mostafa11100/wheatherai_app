// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_semi_circle/flutter_semi_circle.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

Widget charpie_half(context, temprature) {
  return Column(
    children: [
      FlutterSemiCircle(
        height: 210.h,
        width: 230.w,
        thickness: 6,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        totalValue: 100,
        currentValue: temprature,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              temprature.toString(),
              style: TextstyleConst.texts35.copyWith(
                height: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5),
      Text('Degree', style: TextstyleConst.texts18),
    ],
  );
}
