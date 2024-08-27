import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/utils/extension/num.dart';

import '../../../utils/themes/colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.title,
    this.icon,
    required this.bgColor,
    required this.contentColor,
    required this.onTap,
    required this.isBorderedButton,
  });
  final String title;
  final IconData? icon;
  final Color bgColor;
  final Color contentColor;
  final VoidCallback onTap;
  final bool isBorderedButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.h),
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: BoxDecoration(
            color: isBorderedButton ? AppColors.transparent : bgColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: bgColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18.w,
                color: contentColor,
              ),
              5.box,
            ],
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: contentColor,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
