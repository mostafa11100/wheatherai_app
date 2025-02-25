import 'package:wheater_app/core/utilis/functions.dart';
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
