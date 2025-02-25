import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';

class LocalNotfications {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  onDidReceiveNotificationResponse(NotificationResponse response) async {
    //action when user tap on notfication
    final String? payload = response.payload;
    if (response.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  disblaycustomnotfication(bool? canGoOut, GetCurrentEntity? entity, error) {
    String body;

    String title = '🌤️ Weather Update!';
    if (canGoOut != null) {
      String? temperature =
          entity?.temperature.toString(); // استخراج درجة الحرارة
      if (canGoOut) {
        body =
            'The weather is amazing today! ☀️\nTemperature: $temperature°C\nEnjoy your day outside! 😍';
      } else {
        body =
            'Not the best weather today! 🌧️\nTemperature: $temperature°C\nMaybe a cozy indoor day? ☕📺';
      }
    } else {
      body = "oops erro $error ";
    }

    disblaynotfiactionweather(title, body);
  }

  disblaynotfiactionweather(title, body) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'weather_notfication11',
          'weather_notfication',
          channelDescription:
              'weather_notfication for notfication awarn user to go out or no',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'Severe weather alert! Check before going out',
        );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: 'json',
    );
  }
}
