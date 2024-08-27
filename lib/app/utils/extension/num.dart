import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumEx on num {
  SizedBox get box => SizedBox(
        height: toDouble().h,
        width: toDouble().w,
      );

  SizedBox get xBox => SizedBox(
        width: toDouble().w,
      );

  SizedBox get yBox => SizedBox(
        height: toDouble().h,
      );
}
