import 'package:dartz/dartz.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:wheater_app/core/component/notfications/weather_state_ntfc.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/app_lifecycle.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/core/utilis/api_keys.dart';
import 'package:wheater_app/core/utilis/functions.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';
import 'package:wheater_app/futures/home/app_home/domain/usecases/getweather_usecase.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await excutebackgroundfunction();
    return Future.value(true);
  });
}

class WorkManagerApp {
  init() {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    Workmanager().cancelByUniqueName("weather alarm").then((_) {
      Workmanager().registerPeriodicTask(
        "weather alarm",
        "update weather",
        frequency: Duration(minutes: 15),
        constraints: Constraints(networkType: NetworkType.connected),
        existingWorkPolicy: ExistingWorkPolicy.replace,
      );
    });
  }
}
