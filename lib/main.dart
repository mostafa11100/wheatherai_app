import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheater_app/core/approuters/app_routs.dart';
import 'package:wheater_app/core/component/notfications/weather_state_ntfc.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/helper/app_lifecycle.dart';
import 'package:wheater_app/core/services/work_manager.dart';
import 'package:wheater_app/core/utilis/functions.dart';
import 'package:wheater_app/core/utilis/thems.dart';
import 'package:wheater_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  sl<LocalNotfications>().init();
  sl<WorkManagerApp>().init();
  sl<AppLifecycleObserver>().start();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const WheatherApp());
}

class WheatherApp extends StatelessWidget {
  const WheatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          darkTheme: Thems.darktheme(),
          theme: Thems.lighttheme(),
          themeMode: ThemeMode.dark,
          routerConfig: AppRouts.routs,
          //3:16
          // localizationsDelegates: [
          //         S.delegate,
          //         GlobalMateialLocalizations.delegate,
          //         GlobalWidgetsLocalizations.delegate,
          //         GlobalCupertinoLocalizations.delegate,
          //     ],
          //      supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
