import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/l10n/strings.dart';
import 'package:flutter_task/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_task/app/modules/dashboard/views/take_break_view.dart';
import 'package:flutter_task/app/modules/widgets/material/custom_clock.dart';
import 'package:flutter_task/app/modules/widgets/material/custom_dropdown.dart';
import 'package:flutter_task/app/modules/widgets/material/custom_rich_text.dart';
import 'package:flutter_task/app/modules/widgets/material/detail_card_tile.dart';
import 'package:flutter_task/app/modules/widgets/material/process_card.dart';
import 'package:flutter_task/app/modules/widgets/material/statistic_card.dart';
import 'package:flutter_task/app/utils/constants/asset_paths.dart';
import 'package:flutter_task/app/utils/extension/num.dart';
import 'package:get/get.dart';

import '../../../utils/themes/colors.dart';
import '../../widgets/material/custom_appbar.dart';

class DashboardScreenView extends GetView<DashboardController> {
  // DashboardScreenView({Key? key}) : super(key: key);
  const DashboardScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold_FFFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomAppBar(),
              DetailCardTile(
                title: AppStrings.companyName,
                subTitle: AppStrings.companyAddress,
                trailing: const Icon(Icons.keyboard_arrow_down,
                    color: AppColors.primary_FF121237),
                profile: Image.asset(AssetPaths.LOGO_PNG),
              ).marginSymmetric(vertical: 25.h, horizontal: 5.w),
              Row(
                children: [
                  const Expanded(
                    child: StatisticCard(
                      color: AppColors.light_green_FFE9F9F8,
                      title: AppStrings.totalHours,
                      value: AppStrings.totalHrsLabel,
                    ),
                  ),
                  17.box,
                  const Expanded(
                    child: StatisticCard(
                      color: AppColors.light_blue_FFECF0FD,
                      title: AppStrings.totalHours,
                      value: AppStrings.totalHrsLabel,
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 16.w),
              18.box,
              Obx(
                () => CustomDropdown(
                  items: controller.dropDownItems,
                  selectedValue: controller.selectedValue.value,
                  onChanged: (String? newValue) {
                    controller.selectedValue.value = newValue!;
                  },
                ),
              ),
              31.box,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRichText(
                    firstText: AppStrings.lastCheckOut,
                    secondText: AppStrings.totalHours,
                  ),
                ],
              ),
              21.box,
              Obx(
                () => CustomClock(
                  time: controller.formattedTime(false),
                  onTap: () {
                    controller.clockIn();
                    controller.workIn();
                    Get.to(() => const TakeBreakScreenView());
                  },
                ),
              ),
              21.box,
              Row(
                children: [
                  const Expanded(
                    child: ProcessCard(
                      title: AppStrings.addEntry,
                      child: Icon(Icons.newspaper),
                    ),
                  ),
                  17.box,
                  const Expanded(
                    child: ProcessCard(
                      title: AppStrings.setSchedule,
                      child: Icon(Icons.calendar_month),
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 16.w),
            ],
          ),
        ),
      ),
    );
  }
}
