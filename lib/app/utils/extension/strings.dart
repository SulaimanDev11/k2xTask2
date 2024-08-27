import 'package:flutter/material.dart';

extension TimeOfDayExtension on String {
  TimeOfDay toTimeOfDay() {
    String time = this;
    time = time
        .replaceAll("TimeOfDay(", "")
        .replaceAll(")", ""); // Remove "TimeOfDay(" and ")"

    int hour = int.parse(time.split(":")[0]);
    int minute = int.parse(time.split(":")[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }
}
