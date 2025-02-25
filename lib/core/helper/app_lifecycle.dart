import 'package:flutter/material.dart';
// import 'package:workmanager/workmanager.dart';

class AppLifecycleObserver with WidgetsBindingObserver {
  bool _closed = true;
  bool get appstate {
    return _closed;
  }

  void start() {
    WidgetsBinding.instance.addObserver(this);
  }

  void stop() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      // التطبيق دخل في الخلفية أو تقفل
      _closed = true;
    } else if (state == AppLifecycleState.resumed) {
      // التطبيق مفتوح، ألغِ أي WorkManager task
      _closed = false;
    }
  }
}
