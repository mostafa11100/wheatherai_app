import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/futures/auth/signup/presination/widgets/userinfo_widgets.dart';

Widget userinfo({
  context,
  required TextEditingController cntrly,
  required TextEditingController cntrlm,
  required TextEditingController cntrld,
  required TextEditingController cntrllngth,
  required TextEditingController cntrlweigth,
}) {
  return SingleChildScrollView(
    padding: EdgeInsets.zero,
    child: Column(
      children: [
        birthdate(context, cntrly, cntrlm, cntrld),
        SizedBox(height: 8.h),
        lengthwidget(context, cntrllngth, cntrlweigth),
        SizedBox(height: 8.h),
        weighthwidget(context, cntrlweigth),
      ],
    ),
  );
}
