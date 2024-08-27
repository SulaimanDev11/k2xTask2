import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/utils/extension/num.dart';
import 'package:flutter_task/app/utils/themes/colors.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 18.77.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(9.39.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.77.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary_FF121237,
            ),
          ),
          5.box,
          Text(
            value,
            style: TextStyle(
              fontSize: 14.08.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.secondry_FF434363,
            ),
          ),
        ],
      ),
    );
  }
}
