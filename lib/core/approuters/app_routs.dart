import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/futures/auth/signin/presintation/controller/cubit/signin_cubit.dart';
import 'package:wheater_app/futures/auth/signin/presintation/screens/signin_screen.dart';
import 'package:wheater_app/futures/auth/signup/presination/controller/cubit/sign_up_cubit.dart';
import 'package:wheater_app/futures/auth/signup/presination/screens/signup_screen.dart';
import 'package:wheater_app/futures/home/app_home/presintaion/controller/cubit/get_weather_cubit.dart';
import 'package:wheater_app/futures/home/navigation_app_bar/navigation_bar_screen.dart';
import 'package:wheater_app/futures/onbordingscreens/loginorSign_upscreen.dart';
import 'package:wheater_app/futures/onbordingscreens/onbording.dart';

class AppRouts {
  static String splashscreen = "/s";

  static String onbording = "/";

  static String signin = "/signin";

  static String signup = "/signup";
  static String loginorsignup = "/loginorsignup";

  static String app = "/app";
  final getit = GetIt.instance;
  static GoRouter routs = GoRouter(
    routes: [
      GoRoute(
        path: onbording,
        builder: (context, s) {
          return OnbordingScreen();
        },
      ),
      GoRoute(
        path: loginorsignup,
        builder: (context, s) {
          return LoginorsignUpscreen();
        },
      ),
      GoRoute(
        path: signin,
        builder: (context, s) {
          return BlocProvider(
            create: (context) {
              return sl<SigninCubit>();
            },
            child: SigninScreen(),
          );
        },
      ),
      GoRoute(
        path: signup,
        builder: (context, s) {
          return BlocProvider(
            create: (context) => sl<SignUpCubit>(),
            child: SignupScreen(),
          );
        },
      ),
      GoRoute(
        path: app,
        builder: (context, s) {
          return BlocProvider(
            create: (context) => sl<GetWeatherCubit>()..get(days: 1),
            child: NavigationBarAppScreen(),
          );
        },
      ),
    ],
  );
}
