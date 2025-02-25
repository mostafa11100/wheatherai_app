import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:wheater_app/core/component/notfications/weather_state_ntfc.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/app_lifecycle.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';
import 'package:wheater_app/futures/home/app_home/domain/usecases/getweather_usecase.dart';

String? emailvaliation(String? email) {
  if (!EmailValidator.validate(email!)) return AppStrings.emailnotvalid;
  return null;
}

String? signinpaswordvaliation(String? password) {
  if (password!.isEmpty) return AppStrings.cantempty;
  return null;
}

String? passwordvaliation(String? password) {
  if (password!.length < 6) return AppStrings.cantlessthan6;
  return null;
}

Future<void> excutebackgroundfunction() async {
  setupLocator();
  sl<Cashhelper>();
  sl<LocalNotfications>().init();
  sl<AppLifecycleObserver>().start();
  try {
    if (sl<AppLifecycleObserver>().appstate) {
      Either<Failure, GetCurrentEntity> result = await sl<UseCaseGetWeather>()
          .getweather(days: 1);
      result.fold(
        (left) {
          print("notfiaction    error   fetch data feild ${left.error}");

          //handle error
          sl<LocalNotfications>().disblaycustomnotfication(
            null,
            null,
            left.error,
          );
        },
        (right) {
          print("fetch data done ${right.goout}");
          sl<LocalNotfications>().disblaycustomnotfication(
            right.goout!,
            right,
            null,
          );
        },
      );
    }
  } catch (e) {
    //handle error

    sl<LocalNotfications>().disblaycustomnotfication(null, null, e.toString());
  }
}
