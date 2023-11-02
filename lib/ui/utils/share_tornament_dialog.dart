import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/ui/widgets/widgets.dart';
import 'package:get/get.dart';

Future shareTornamentDialog() async {
  return await Get.dialog(
    Material(
      type: MaterialType.transparency,
      child: Center(
        child: ColoredBox(
          color: AppColors.scaffoldBackgroundColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: SizedBox(
              width: MediaQuery.sizeOf(Get.context!).width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Image.asset(AppImages.tournament_share_photo),
                      Positioned.fill(
                        child: Center(
                          child: CustomText(
                            'Share Tournament',
                            style: AppTextStyles.regularMax,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    'Ready, set, play! Join our tournament by clicking on this link and invite others too',
                    style: AppTextStyles.regular.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ).paddingSymmetric(vertical: 21.h, horizontal: 28.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.greyX,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: CustomText(
                      'https://test-bracket.gamr.africa/tournament/view/YETII',
                      style: AppTextStyles.regular.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ).paddingSymmetric(horizontal: 36.w),
                  25.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.whatsapp),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.twitter),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.reddit),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.discord),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.facebook),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 42.w),
                  16.verticalSpace,
                  CustomElevatedButton(
                    onPressed: () {},
                    title: 'Copy Link',
                    buttonColor: AppColors.deepRed,
                    borderRadius: 8.r,
                  ).paddingSymmetric(horizontal: 23.w),
                  29.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
