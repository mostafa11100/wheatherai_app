import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

// ignore: non_constant_identifier_names
Widget SimpleButton({
  onprs,
  text,
  required Color bckgrundclr,
  required Color txtcolor,
}) {
  return ElevatedButton(
    onPressed: onprs,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
      backgroundColor: bckgrundclr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
    ),
    child: Text(
      text.toString(),
      style: TextstyleConst.texts23.copyWith(
        color: txtcolor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
