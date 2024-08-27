import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/l10n/strings.dart';
import 'package:flutter_task/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_task/app/modules/dashboard/views/save_entry_view.dart';
import 'package:flutter_task/app/modules/widgets/material/action_button.dart';
import 'package:flutter_task/app/modules/widgets/material/custom_appbar.dart';
import 'package:flutter_task/app/modules/widgets/material/custom_rich_text.dart';
import 'package:flutter_task/app/modules/widgets/material/detail_card_tile.dart';
import 'package:flutter_task/app/utils/constants/asset_paths.dart';
import 'package:flutter_task/app/utils/extension/num.dart';
import 'package:flutter_task/app/utils/extension/time.dart';
import 'package:get/get.dart';

import '../../../utils/themes/colors.dart';

class TakeBreakScreenView extends GetView<DashboardController> {
  const TakeBreakScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold_FFFFFFFF,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  31.box,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            AppStrings.dayTotal,
                            style: TextStyle(
                              color: AppColors.secondry_FF434363,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                          10.box,
                          Obx(
                            () => Text(
                              controller.formattedActualTime(false),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            AppStrings.breakTotal,
                            style: TextStyle(
                              color: AppColors.secondry_FF434363,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                          10.box,
                          Obx(
                            () => Text(
                              controller.formattedActualTime(true),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  10.box,
                  Obx(
                    () => controller.isBreakStart.value
                        ? Column(
                            children: [
                              const Divider(
                                color: AppColors.dark_gray_FFE8E8EC,
                              ),
                              10.box,
                              Image.asset(
                                AssetPaths.LUNCH_PNG,
                                height: 90.h,
                              ),
                              Text(
                                AppStrings.breakInProgress,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.secondry_FF434363,
                                ),
                              ),
                              Text(
                                controller.formattedTime(true),
                                style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.secondry_FF434363,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
            21.box,
            Obx(
              () => controller.isBreakStart.value
                  ? const SizedBox.shrink()
                  : CustomRichText(
                      firstText: AppStrings.startingTime,
                      secondText:
                          controller.checkInTime.value.toReadableString(),
                    ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => ActionButton(
                      title: controller.isBreakStart.value
                          ? AppStrings.endBreak
                          : AppStrings.takeBreak,
                      icon: controller.isBreakStart.value
                          ? Icons.play_arrow
                          : Icons.pause,
                      bgColor: controller.isBreakStart.value
                          ? AppColors.green_FF1CBE51
                          : AppColors.dark_gray_FFE8E8EC,
                      contentColor: controller.isBreakStart.value
                          ? AppColors.white_FFFFFFFF
                          : AppColors.primary_FF121237,
                      isBorderedButton: false,
                      onTap: () {
                        if (controller.isBreakStart.value) {
                          controller.workIn();
                          controller.breakEnd();
                        } else {
                          controller.workOut();
                          controller.breakStart();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            16.box,
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    title: AppStrings.clockout,
                    icon: Icons.arrow_forward,
                    bgColor: AppColors.red_FFFF5B5B,
                    contentColor: AppColors.white_FFFFFFFF,
                    isBorderedButton: false,
                    onTap: () {
                      controller.clockOut();
                      controller.workOut();
                      controller.breakEnd();
                      Get.to(() => const SaveEntryScreenView());
                    },
                  ),
                ),
              ],
            ).marginOnly(bottom: 27.h),
          ],
        ),
      ),
    );
  }
}
