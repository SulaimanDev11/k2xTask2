import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/utils/themes/colors.dart';

class DetailCardTile extends StatelessWidget {
  const DetailCardTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.trailing,
    required this.profile,
  });
  final String title;
  final String subTitle;
  final Widget? trailing;
  final Widget profile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 42.h,
        width: 42.h,
        decoration: BoxDecoration(
            color: AppColors.blue_FF14143C,
            borderRadius: BorderRadius.circular(50.r)),
        child: profile,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary_FF121237,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondry_FF434363,
        ),
      ),
      trailing: trailing,
    );
  }
}
