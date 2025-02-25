import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/component/textfeild/simple_textfeld.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/core/utilis/functions.dart';
import 'package:wheater_app/futures/auth/signup/presination/controller/cubit/sign_up_cubit.dart';

Widget formofsignupfields({
  required GlobalKey formkey,
  required BuildContext context,
  required TextEditingController name,

  required TextEditingController email,

  required TextEditingController password,

  required bool visible,
}) {
  return Form(
    key: formkey,

    child: Column(
      children: [
        customtextfeild(
          label: AppStrings.fullname,
          context: context,
          controler: name,
          icon: null, //visible or not
          visible: false,
          validatior: signinpaswordvaliation,
        ),

        SizedBox(height: 10.h),
        customtextfeild(
          label: AppStrings.email,
          context: context,
          controler: email,
          icon: null, //visible or not
          visible: false,
          validatior: emailvaliation,
        ),
        SizedBox(height: 10.h),
        customtextfeild(
          label: AppStrings.password,
          context: context,
          controler: password,
          icon: Opacity(
            opacity: .5,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                SignUpCubit.plocprovider(context).passwordstate(visible);
              },
              child: Icon(
                visible == true
                    ? Icons.visibility_off
                    : Icons.visibility_outlined,
              ),
            ),
          ), //visible or not
          visible: visible,
          validatior: signinpaswordvaliation,
        ),
      ],
    ),
  );
}
