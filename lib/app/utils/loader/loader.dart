import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final class Load {
  static void show(String status) {
    EasyLoading.show(status: status);
  }

  static void error(String status) {
    EasyLoading.showError(status);
  }

  static void info(String status) {
    EasyLoading.showInfo(status);
  }

  static void success(String status) {
    EasyLoading.showSuccess(status);
  }

  static void dismiss(String status) {
    EasyLoading.dismiss();
  }

  static TransitionBuilder init() {
    return EasyLoading.init();
  }

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..userInteractions = false;
  }
}
