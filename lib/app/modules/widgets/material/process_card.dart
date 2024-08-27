import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/utils/extension/num.dart';
import 'package:flutter_task/app/utils/themes/colors.dart';

class ProcessCard extends StatelessWidget {
  const ProcessCard({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 18.77.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.dark_gray_FFE8E8EC,
        borderRadius: BorderRadius.circular(9.39.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 5.w,
              vertical: 5.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.dark_gray_plus_FFD4D4DD,
              borderRadius: BorderRadius.circular(9.39.r),
            ),
            child: child,
          ),
          14.box,
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary_FF121237,
            ),
          ),
        ],
      ),
    );
  }
}
