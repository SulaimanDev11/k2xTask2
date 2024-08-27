// time_of_day_extensions.dart
import 'package:flutter/material.dart';

extension ReadableTimeOfDay on TimeOfDay {
  String toReadableString() {
    final hours = hour % 12 == 0 ? 12 : hour % 12;
    final period = hour >= 12 ? 'PM' : 'AM';
    final minutes = minute.toString().padLeft(2, '0');
    return '$hours:$minutes $period';
  }

  int toMinutes() => hour * 60 + minute;

  String difference(TimeOfDay other) {
    int differenceInMinutes = (toMinutes() - other.toMinutes()).abs();

    int hours = differenceInMinutes ~/ 60;
    int minutes = differenceInMinutes % 60;

    return '${hours}h - ${minutes}m';
  }
}
