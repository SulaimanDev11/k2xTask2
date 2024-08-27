// date_time_extensions.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ReadableDateTime on DateTime {
  String toReadableDateString() {
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    return formatter.format(this);
  }

  String toServerDateFormatString() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }

  String toReadableDateTimeString() {
    final DateFormat formatter = DateFormat('MMM d, yyyy hh:mm a');
    return formatter.format(this);
  }

  DateTime combineWithTimeOfDay(TimeOfDay timeOfDay) {
    return DateTime(
      year,
      month,
      day,
      timeOfDay.hour,
      timeOfDay.minute,
      0, // Seconds
      0, // Milliseconds
      0, // Microseconds
    );
  }

  String toIso8601WithMillis() {
    final dateTimeUtc = toUtc();
    return '${dateTimeUtc.toIso8601String().replaceAll('Z', '')}.${dateTimeUtc.millisecond.toString().padLeft(3, '0')}Z';
  }
}
