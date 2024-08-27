import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/utils/extension/num.dart';
import 'package:flutter_task/app/utils/themes/colors.dart';

class IconActionButton extends StatelessWidget {
  const IconActionButton({
    super.key,
    required this.value,
    required this.icon,
    this.onTap,
  });
  final String value;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 15.w),
            decoration: BoxDecoration(
              color: AppColors.light_gray_FFF6F6F6,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 24.r,
                  color: AppColors.secondry_FF434363,
                ),
                10.box,
                SelectableText(
                  value,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondry_FF434363,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
