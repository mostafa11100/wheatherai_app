import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

Widget customtextfeild({
  required context,
  required TextEditingController controler,
  label,
  icon,
  String? Function(String?)? validatior,
  visible,
  errortext,
  hint,
  intialvalue,
  align,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h),
        child:
            label != null
                ? Text(
                  label,
                  style: TextstyleConst.texts18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                )
                : null,
      ),
      SizedBox(height: 3.h),
      TextFormField(
        cursorColor: AppColors.colorwhite,
        textAlign: align ?? TextAlign.start,
        validator: validatior,
        obscureText: visible ?? false,
        controller: controler,
        initialValue: intialvalue,
        decoration: InputDecoration(
          hintText: hint,

          contentPadding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 15.h,
          ),
          hintStyle: TextstyleConst.texts18.copyWith(
            fontWeight: FontWeight.w500,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(28.r),
          ),
          fillColor: Theme.of(context).primaryColorLight,
          filled: true,
          suffixIcon: icon,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(28.r),
          ),
          // alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(28.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(28.r),
          ),
        ),
      ),
    ],
  );
}
