import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/core/approuters/app_routs.dart';
import 'package:wheater_app/core/component/buttons/simple_button.dart';
import 'package:wheater_app/core/component/dialog/loading.dart';
import 'package:wheater_app/core/utilis/app_colors.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/core/utilis/textstyle_const.dart';
import 'package:wheater_app/futures/auth/signup/domain/enititys/signup_entitys.dart';
import 'package:wheater_app/futures/auth/signup/presination/controller/cubit/sign_up_cubit.dart';
import 'package:wheater_app/futures/auth/signup/presination/screens/user_info.dart';
import 'package:wheater_app/futures/auth/signup/presination/widgets/form_of_feild_signup.dart';
import 'package:wheater_app/futures/auth/signup/presination/widgets/page_indecator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState>? formkey;
  TextEditingController? emilcntrol;

  TextEditingController? passwordcntrol;

  TextEditingController? yearcontroler;

  TextEditingController? monthcontroler;

  TextEditingController? daycontroler;

  TextEditingController? weightcontroler;

  TextEditingController? tallcontroler;

  TextEditingController? namecontroler;
  PageController? pageControler;
  @override
  void initState() {
    emilcntrol = TextEditingController();

    namecontroler = TextEditingController();
    passwordcntrol = TextEditingController();
    yearcontroler = TextEditingController();
    monthcontroler = TextEditingController();
    daycontroler = TextEditingController();
    weightcontroler = TextEditingController();
    tallcontroler = TextEditingController();
    formkey = GlobalKey<FormState>();
    pageControler = PageController();
    super.initState();
  }

  bool visible = false;
  List<double> height = [295.h, 350.h];
  bool error = false;
  int index = 0;
  onpres() {
    if (validatfunction() && index < 2) {
      pageControler!.animateToPage(
        index + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      setState(() {
        error = true;
      });
    }
  }

  ontap() {
    if (index > 0) {
      SignUpCubit.plocprovider(context).signup(
        SignUpEntity(
          email: emilcntrol!.text,
          password: passwordcntrol!.text,
          birthdate: {
            AppStrings.yyy: yearcontroler!.text,
            AppStrings.mm: monthcontroler!.text,
            AppStrings.dd: daycontroler!.text,
          },
          name: namecontroler!.text,
          tall: int.parse(tallcontroler!.text),
          weight: double.parse(weightcontroler!.text),
        ),
      );
    } else {
      onpres();
    }
  }

  double calcheght(eror) {
    if (eror) {
      return height[1];
    }
    return height[0];
  }

  @override
  void dispose() {
    emilcntrol!.dispose();
    passwordcntrol!.dispose();
    namecontroler!.dispose();
    weightcontroler!.dispose();
    tallcontroler!.dispose();
    yearcontroler!.dispose();
    monthcontroler!.dispose();
    daycontroler!.dispose();
    pageControler!.dispose();
    super.dispose();
  }

  bool validatfunction() {
    return formkey!.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            context.pop();
            showsuccess(
              () {
                GoRouter.of(context).pushReplacement(AppRouts.signin);
              },
              context,
              AppStrings.successacount,
            );
            //success
          }
          if (state is SignUpFailur) {
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
          }
          if (state is SignUpLoading) {
            showloadingdialog(context);
          }
          if (state is SignUppasswordstate) {
            setState(() {
              visible = state.visible;
            });
          }
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.colorwhitetransparnt, Colors.transparent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
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
                        AppStrings.signup2,
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
                      SizedBox(height: 30.h),
                      SingleChildScrollView(
                        child: AnimatedContainer(
                          height: calcheght(error),
                          duration: Duration.zero,
                          child: PageView(
                            onPageChanged: (i) {
                              setState(() {
                                error = false;
                                index = i;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                            controller: pageControler,
                            children: [
                              formofsignupfields(
                                formkey: formkey!,
                                context: context,
                                name: namecontroler!,
                                email: emilcntrol!,
                                password: passwordcntrol!,
                                visible: visible,
                              ),
                              userinfo(
                                cntrly: yearcontroler!,
                                cntrlm: monthcontroler!,
                                cntrld: daycontroler!,
                                context: context,
                                cntrllngth: tallcontroler!,
                                cntrlweigth: weightcontroler!,
                              ),
                            ],
                          ),
                        ),
                      ),
                      pageindecator(index, context),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 330.w,
                        child: SimpleButton(
                          text:
                              index < 1 ? AppStrings.next : AppStrings.signup2,
                          onprs: ontap,
                          bckgrundclr: Theme.of(context).colorScheme.secondary,
                          txtcolor: AppColors.colorwhite,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          AppStrings.haveacount,
                          style: TextstyleConst.texts13.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
