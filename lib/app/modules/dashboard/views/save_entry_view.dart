import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/l10n/strings.dart';
import 'package:flutter_task/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_task/app/modules/widgets/material/action_button.dart';
import 'package:flutter_task/app/modules/widgets/material/custom_appbar.dart';
import 'package:flutter_task/app/modules/widgets/material/detail_card_tile.dart';
import 'package:flutter_task/app/modules/widgets/material/icon_action_button.dart';
import 'package:flutter_task/app/modules/widgets/material/time_picker.dart';
import 'package:flutter_task/app/utils/constants/asset_paths.dart';
import 'package:flutter_task/app/utils/extension/date.dart';
import 'package:flutter_task/app/utils/extension/num.dart';
import 'package:flutter_task/app/utils/extension/time.dart';
import 'package:get/get.dart';
import '../../../utils/themes/colors.dart';

class SaveEntryScreenView extends GetView<DashboardController> {
  const SaveEntryScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.calculateTotalBreakTime();
    return Scaffold(
      backgroundColor: AppColors.scaffold_FFFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomAppBar(),
              DetailCardTile(
                title: AppStrings.companyName,
                subTitle: AppStrings.companyAddress,
                profile: Image.asset(AssetPaths.LOGO_PNG),
              ).marginSymmetric(vertical: 25.h, horizontal: 5.w),
              5.box,
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: 25.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.light_gray_FFF6F6F6,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.todayTotalTime,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondry_FF434363,
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.formattedTime(false),
                        style: TextStyle(
                          color: AppColors.primary_FF121237,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                AppStrings.start,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).marginOnly(left: 16.w, top: 10.h),
              Row(
                children: [
                  Expanded(
                    child: IconActionButton(
                      value: DateTime.now().toReadableDateString(),
                      icon: Icons.calendar_month,
                    ),
                  ),
                  19.box,
                  Expanded(
                    child: Obx(
                      () => IconActionButton(
                        value: controller.checkInTime.value.toReadableString(),
                        icon: Icons.watch_later_outlined,
                        onTap: () async {
                          TimeOfDay? time =
                              await TimePickerService.getTime(context);
                          if (time != null) {
                            controller.checkInTime.value = time;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 16.w),
              Text(
                AppStrings.end,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).marginOnly(left: 16.w, top: 10.h),
              Row(
                children: [
                  Expanded(
                    child: IconActionButton(
                      value: DateTime.now().toReadableDateString(),
                      icon: Icons.calendar_month,
                    ),
                  ),
                  19.box,
                  Expanded(
                    child: Obx(
                      () => IconActionButton(
                        value: controller.checkOutTime.value.toReadableString(),
                        icon: Icons.watch_later_outlined,
                        onTap: () async {
                          TimeOfDay? time =
                              await TimePickerService.getTime(context);
                          if (time != null) {
                            controller.checkOutTime.value = time;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 16.w),
              Text(
                AppStrings.breaks,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).marginOnly(left: 16.w, top: 10.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.light_gray_FFF6F6F6,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Obx(
                      () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.breakTimeParams.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${controller.breakTimeParams[index].start.toReadableString()} - ${controller.breakTimeParams[index].end.toReadableString()}',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  Text(
                                    // ignore: unnecessary_string_interpolations
                                    '${controller.breakTimeParams[index].start.difference(controller.breakTimeParams[index].end)}',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 16.w);
                        },
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.box,
                        GestureDetector(
                          onTap: () {
                            addBreakTime(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.5.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: AppColors.dark_gray_FFE8E8EC,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add, size: 14.r),
                                Text(
                                  AppStrings.addBreak,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        10.box,
                        const Divider(color: AppColors.dark_gray_FFE8E8EC),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.breakTotal,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.secondry_FF434363,
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.totBreakTime.value,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.secondry_FF434363,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ).paddingSymmetric(horizontal: 16.w),
                  ],
                ),
              ),
              Text(
                AppStrings.reportTo,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).marginOnly(left: 16.w, top: 10.h),
              DetailCardTile(
                title: 'James Curtis',
                subTitle: 'Manager',
                profile: Center(
                  child: Text(
                    'JC',
                    style: TextStyle(
                      color: AppColors.white_FFFFFFFF,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              18.box,
              Row(
                children: [
                  Expanded(
                    child: ActionButton(
                      title: AppStrings.save,
                      bgColor: AppColors.primary_FF121237,
                      contentColor: AppColors.white_FFFFFFFF,
                      isBorderedButton: false,
                      onTap: () {
                        controller.saveUserData();
                      },
                    ),
                  ),
                ],
              ),
              16.box,
              Row(
                children: [
                  Expanded(
                    child: ActionButton(
                      title: AppStrings.saveAsPdf,
                      icon: Icons.picture_as_pdf_outlined,
                      bgColor: AppColors.primary_FF121237,
                      contentColor: AppColors.primary_FF121237,
                      isBorderedButton: true,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> addBreakTime(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white_FFFFFFFF,
        title: Text(
          AppStrings.addBreak,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.breakStart,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Obx(
                      () => IconActionButton(
                        value: controller.breakInTime.value.toReadableString(),
                        icon: Icons.watch_later_outlined,
                        onTap: () async {
                          TimeOfDay? time =
                              await TimePickerService.getTime(context);
                          if (time != null) {
                            controller.breakInTime.value = time;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                5.box,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.breakEnd,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Obx(
                      () => IconActionButton(
                        value: controller.breakOutTime.value.toReadableString(),
                        icon: Icons.watch_later_outlined,
                        onTap: () async {
                          TimeOfDay? time =
                              await TimePickerService.getTime(context);
                          if (time != null) {
                            controller.breakOutTime.value = time;
                          }
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            16.box,
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    title: AppStrings.save,
                    bgColor: const Color.fromRGBO(18, 18, 55, 1),
                    contentColor: AppColors.white_FFFFFFFF,
                    isBorderedButton: false,
                    onTap: () {
                      controller.addBreakTimeToList();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            16.box,
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    title: AppStrings.cancel,
                    bgColor: AppColors.primary_FF121237,
                    contentColor: AppColors.primary_FF121237,
                    isBorderedButton: true,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
