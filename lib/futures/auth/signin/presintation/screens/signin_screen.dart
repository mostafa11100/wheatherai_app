import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/core/component/buttons/simple_button.dart';
import 'package:wheater_app/core/component/dialog/loading.dart';
import 'package:wheater_app/core/component/textfeild/simple_textfeld.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/core/utilis/functions.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';
import 'package:wheater_app/futures/auth/signin/presintation/controller/cubit/signin_cubit.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  GlobalKey<FormState>? formkey;
  TextEditingController? emilcntrol;

  TextEditingController? passwordcntrol;
  bool? visible;

  @override
  void initState() {
    visible = false;
    emilcntrol = TextEditingController();
    passwordcntrol = TextEditingController();
    formkey = GlobalKey<FormState>();
    super.initState();
  }

  validatfunction() {
    return formkey!.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSucces) {
            context.pop();

            //GoRouter.of(context).push(AppRoutes.home)
          } else if (state is SigninFailure) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: TextstyleConst.texts15.copyWith(
                    color: AppColors.colorwhite,
                  ),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          } else if (state is SigninLoading) {
            showloadingdialog(context);
          } else if (state is TextFeildState) {
            setState(() {
              visible = state.visible;
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.colorwhitetransparnt, Colors.transparent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.login2,
                      style: TextstyleConst.texts40.copyWith(
                        letterSpacing: 4.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      AppStrings.creatanacounttomakesdf,
                      style: TextstyleConst.texts15.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Form(
                      key: formkey,

                      child: Column(
                        children: [
                          customtextfeild(
                            label: AppStrings.email,
                            context: context,
                            controler: emilcntrol!,
                            icon: null, //visible or not
                            visible: false,
                            validatior: emailvaliation,
                          ),
                          SizedBox(height: 10.h),
                          customtextfeild(
                            label: AppStrings.password,
                            context: context,
                            controler: passwordcntrol!,
                            icon: Opacity(
                              opacity: .5,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  SigninCubit.blocprovider(
                                    context,
                                  ).feildstate(visible);
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                AppStrings.forgetpassword,
                                style: TextstyleConst.texts15.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: 300.w,
                            child: SimpleButton(
                              text: AppStrings.login2,
                              onprs: () {
                                if (validatfunction()) {
                                  SigninCubit.blocprovider(context).signin(
                                    email: emilcntrol!.text,
                                    password: passwordcntrol!.text,
                                  );
                                }
                              },
                              bckgrundclr:
                                  Theme.of(context).colorScheme.secondary,
                              txtcolor: AppColors.colorwhite,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              AppStrings.donthaveacount,
                              style: TextstyleConst.texts13.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
