import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/params/params.dart';
import 'package:flutter_task/app/data/usecase/save_user_usecase.dart';
import 'package:flutter_task/app/l10n/strings.dart';
import 'package:flutter_task/app/utils/extension/date.dart';
import 'package:flutter_task/app/utils/extension/time.dart';
import 'package:flutter_task/app/utils/loader/loader.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  DashboardController({required this.saveUserUsecase});

  final SaveUserUsecase saveUserUsecase;

  RxList<String> dropDownItems = ['Remote', 'Office', 'Hybrid'].obs;
  RxString selectedValue = 'Remote'.obs;
  RxList<BreakTimeParams> breakTimeParams = <BreakTimeParams>[].obs;
  Timer? timer;
  Timer? breakTimer;
  Timer? workTimer;
  RxInt seconds = 0.obs;
  RxInt breakSecs = 0.obs;
  RxBool isClockedIn = false.obs;
  RxBool isWorkedIn = false.obs;
  RxBool isBreakStart = false.obs;
  Rx<TimeOfDay> checkInTime = Rx<TimeOfDay>(TimeOfDay.now());
  Rx<TimeOfDay> checkOutTime = Rx<TimeOfDay>(TimeOfDay.now());
  Rx<TimeOfDay> breakInTime = Rx<TimeOfDay>(TimeOfDay.now());
  Rx<TimeOfDay> breakOutTime = Rx<TimeOfDay>(TimeOfDay.now());
  RxString totBreakTime = ''.obs;
  RxInt totBreakMins = 0.obs;
  RxInt totalBreakTakkenToday = 0.obs;
  RxInt totalWorkDoneToday = 0.obs;

  void clockIn() {
    if (!isClockedIn.value) {
      isClockedIn.value = true;
      checkInTime.value = TimeOfDay.now();
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          seconds.value++;
        },
      );
    }
  }

  void clockOut() {
    if (isClockedIn.value) {
      isClockedIn.value = false;
      // seconds.value = 0;
      checkOutTime.value = TimeOfDay.now();
      timer?.cancel();
    }
  }

  void workIn() {
    if (!isWorkedIn.value) {
      isWorkedIn.value = true;
      workTimer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          totalWorkDoneToday.value++;
        },
      );
    }
  }

  void workOut() {
    if (isWorkedIn.value) {
      isWorkedIn.value = false;
      workTimer?.cancel();
    }
  }

  void breakStart() {
    if (!isBreakStart.value) {
      isBreakStart.value = true;
      breakInTime.value = TimeOfDay.now();

      breakTimer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          breakSecs.value++;
          totalBreakTakkenToday.value++;
        },
      );
    }
  }

  void breakEnd() {
    if (isBreakStart.value) {
      isBreakStart.value = false;
      breakSecs.value = 0;
      breakOutTime.value = TimeOfDay.now();
      addBreakTimeToList();
      breakTimer?.cancel();
    }
  }

  String formatDigit(int n) => n.toString().padLeft(2, '0');

  String formattedTime(bool isBreak) {
    int hours = isBreak ? breakSecs ~/ 3600 : seconds ~/ 3600;
    int minutes = isBreak ? (breakSecs % 3600) ~/ 60 : (seconds % 3600) ~/ 60;
    int secs =
        isBreak ? int.parse('${breakSecs % 60}') : int.parse('${seconds % 60}');
    return '${formatDigit(hours)}:${formatDigit(minutes)}:${formatDigit(secs)}';
  }

  String formattedActualTime(bool isBreak) {
    int hours =
        isBreak ? totalBreakTakkenToday ~/ 3600 : totalWorkDoneToday ~/ 3600;
    int minutes = isBreak
        ? (totalBreakTakkenToday % 3600) ~/ 60
        : (totalWorkDoneToday % 3600) ~/ 60;
    int secs = isBreak
        ? int.parse('${totalBreakTakkenToday % 60}')
        : int.parse('${totalWorkDoneToday % 60}');
    return '${formatDigit(hours)}:${formatDigit(minutes)}:${formatDigit(secs)}';
  }

  void addBreakTimeToList() {
    breakTimeParams.add(
      BreakTimeParams(
        start: breakInTime.value,
        end: breakOutTime.value,
      ),
    );
  }

  void calculateTotalBreakTime() {
    int totalMinutes = 0;

    for (var breakTime in breakTimeParams) {
      TimeOfDay startTime = breakTime.start;
      TimeOfDay endTime = breakTime.end;
      int differenceInMinutes =
          (startTime.toMinutes() - endTime.toMinutes()).abs();
      totalMinutes += differenceInMinutes;
    }

    int totalHours = totalMinutes ~/ 60;
    int totalRemainingMinutes = totalMinutes % 60;
    totBreakMins.value = totalMinutes;
    totBreakTime.value = '${totalHours}h - ${totalRemainingMinutes}m';
  }

  Future<void> saveUserData() async {
    Load.show(AppStrings.savingData);

    try {
      if (seconds.value == 0) {
        Load.info(AppStrings.zeroTime);
        return;
      }
      bool? created = await saveUserUsecase(
        SaveUserParams(
          name: AppStrings.userName,
          checkInDateTime: DateTime.now()
              .combineWithTimeOfDay(checkInTime.value)
              .toIso8601String(),
          checkOutDateTime: DateTime.now()
              .combineWithTimeOfDay(checkOutTime.value)
              .toIso8601String(),
          breakTime: breakTimeParams,
        ),
      );
      if (created) {
        breakTimeParams.clear();
        seconds.value = 0;
        breakSecs.value = 0;
        totalBreakTakkenToday.value = 0;
        totalWorkDoneToday.value = 0;
        debugPrint(AppStrings.dataCreated);
      } else {
        debugPrint(AppStrings.failedCreate);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    dropDownItems.close();
    selectedValue.close();
    seconds.close();
    timer?.cancel();
    isClockedIn.close();
    isBreakStart.close();
    checkInTime.close();
    checkOutTime.close();
    breakInTime.close();
    breakOutTime.close();
    totBreakTime.close();
    totBreakTime.close();
    totBreakMins.close();
    totalBreakTakkenToday.close();
    totalWorkDoneToday.close();
  }
}
