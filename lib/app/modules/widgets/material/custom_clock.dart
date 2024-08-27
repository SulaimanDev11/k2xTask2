import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/l10n/strings.dart';
import 'package:flutter_task/app/utils/themes/colors.dart';

class CustomClock extends StatelessWidget {
  const CustomClock({
    super.key,
    required this.time,
    required this.onTap,
  });
  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 300.w,
            width: 300.w,
            decoration: BoxDecoration(
              color: AppColors.light_gray_FFF6F6F6,
              borderRadius: BorderRadius.circular(300.r),
            ),
            child: Center(
              child: Container(
                height: 264.w,
                width: 264.w,
                decoration: BoxDecoration(
                  color: AppColors.dark_gray_plus_FFD4D4DD,
                  borderRadius: BorderRadius.circular(300.r),
                ),
                child: Center(
                  child: Container(
                    height: 235.w,
                    width: 235.w,
                    decoration: BoxDecoration(
                      color: AppColors.primary_FF121237,
                      borderRadius: BorderRadius.circular(235.r),
                    ),
                    child: Center(
                      child: Container(
                        height: 210.w,
                        width: 210.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary_FF121237,
                          borderRadius: BorderRadius.circular(235.r),
                        ),
                        child: DottedBorder(
                          dashPattern: const [20],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(220.r),
                          strokeWidth: 10.w,
                          color: AppColors.dark_gray_plus_FFD4D4DD,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.r),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    time,
                                    style: TextStyle(
                                      color: AppColors.white_FFFFFFFF,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32.sp,
                                    ),
                                  ),
                                  Text(
                                    AppStrings.clockIn,
                                    style: TextStyle(
                                      color: AppColors.dark_gray_plus_FFD4D4DD,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
