import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamr/data/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle regular = TextStyle(
    color: AppColors.white,
    fontSize: 14.sp,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
  );

  static TextStyle regularMini = TextStyle(
    color: AppColors.white,
    fontSize: 10.sp,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
  );

  static TextStyle regularMax = TextStyle(
    color: AppColors.white,
    fontSize: 24.sp,
    letterSpacing: -0.48,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
  );

  static TextStyle light = TextStyle(
    color: AppColors.white,
    fontSize: 14.sp,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
  );
}
