import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/app/l10n/strings.dart';
import 'package:flutter_task/app/utils/constants/asset_paths.dart';
import 'package:flutter_task/app/utils/themes/colors.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.dark_gray_FFE8E8EC,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetPaths.MENU_SVG,
            semanticsLabel: AppStrings.menuButtonLabel,
          ).paddingOnly(left: 16, right: 59.w),
          Text(
            AppStrings.appBarTitle,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
