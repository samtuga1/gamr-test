import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/models/data/data.dart';
import 'package:gamr/ui/widgets/widgets.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.userData});

  final UserData userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppImages.tournament_share_photo,
                  height: 130.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: -40,
                  left: 20,
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundImage: NetworkImage(userData.data.avatar),
                  ),
                ),
              ],
            ),
            50.verticalSpace,
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  const CustomText(
                    'Username :',
                    color: AppColors.tinyGrey,
                  ),
                  CustomText(
                    userData.data.username,
                    fontSize: 20.sp,
                  ),
                  30.verticalSpace,
                  const CustomText(
                    'Display name :',
                    color: AppColors.tinyGrey,
                  ),
                  CustomText(
                    userData.data.displayName,
                    fontSize: 20.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
