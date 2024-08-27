import 'package:flutter/material.dart';
import 'package:flutter_task/app/utils/extension/date.dart';
import 'package:get/get.dart';

abstract class Params {}

class NoParams extends Params {}

class SaveUserParams extends Params {
  final String name;
  final String checkInDateTime;
  final String checkOutDateTime;
  final RxList<BreakTimeParams> breakTime;

  SaveUserParams({
    required this.name,
    required this.checkInDateTime,
    required this.checkOutDateTime,
    required this.breakTime,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "checkInDateTime": checkInDateTime,
        "checkOutDateTime": checkOutDateTime,
        "breakTime": breakTime,
      };
}

class BreakTimeParams extends Params {
  final TimeOfDay start;
  final TimeOfDay end;

  BreakTimeParams({
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJson() => {
        "start": DateTime.now().combineWithTimeOfDay(start).toIso8601String(),
        "end": DateTime.now().combineWithTimeOfDay(end).toIso8601String(),
      };
}

class HttpResponse{
  
}
