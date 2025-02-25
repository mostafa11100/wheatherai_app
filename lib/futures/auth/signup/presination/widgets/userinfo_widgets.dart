import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/component/textfeild/simple_textfeld.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';

Widget weighthwidget(context, TextEditingController cntrlw) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 1.h),
        child: Text(
          AppStrings.weight,
          style: TextstyleConst.texts18.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20.w,
          children: [
            Expanded(
              child: customtextfeild(
                align: TextAlign.center,
                context: context,
                controler: cntrlw,
                hint: "75",
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                AppStrings.kg,
                style: TextstyleConst.texts18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget lengthwidget(
  context,
  TextEditingController cntrlth,

  TextEditingController cntrlw,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 1.h),
        child: Text(
          AppStrings.length,
          style: TextstyleConst.texts18.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20.w,
          children: [
            Expanded(
              child: customtextfeild(
                align: TextAlign.center,
                context: context,
                controler: cntrlth,
                hint: "170",
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                AppStrings.cm,
                style: TextstyleConst.texts18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget birthdate(
  context,
  TextEditingController cntrly,
  TextEditingController cntrlm,
  TextEditingController cntrld,
) {
  return SizedBox(
    //  height: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 1.h),
          child: Text(
            AppStrings.birthdate,
            style: TextstyleConst.texts18.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.w,
            children: [
              Flexible(
                child: customtextfeild(
                  align: TextAlign.center,
                  context: context,
                  controler: cntrly,
                  hint: AppStrings.yyy,
                ),
              ),

              Flexible(
                child: customtextfeild(
                  align: TextAlign.center,
                  context: context,
                  controler: cntrlm,
                  hint: AppStrings.mm,
                ),
              ),

              Flexible(
                child: customtextfeild(
                  align: TextAlign.center,
                  context: context,
                  controler: cntrld,
                  hint: AppStrings.dd,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
