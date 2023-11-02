import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/models/data/data.dart';
import 'package:gamr/router/router.dart';
import 'package:gamr/ui/widgets/widgets.dart';
import 'package:gamr/utils/extensions.dart';
import 'package:get/get.dart';

class TornamentCard extends StatelessWidget {
  const TornamentCard({super.key, required this.tournament});
  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    // time span for the tournament
    String duration =
        '${(tournament.startedAt).day.toOrdinal()} - ${(tournament.endedAt).day.toOrdinal()} ${tournament.endedAt.month.monthInWords()}';

    // check if stating and ending date of time span is the same or not
    if (tournament.startedAt.month != tournament.endedAt.month) {
      duration =
          '${(tournament.startedAt).day.toOrdinal()} ${tournament.endedAt.month.monthInWords()} - ${(tournament.endedAt).day.toOrdinal()} ${tournament.endedAt.month.monthInWords()}';
    }
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.tournament_detail, arguments: tournament.slug),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CustomCacheImage(
              imageUrl: tournament.banner,
              height: null,
              width: null,
              progressIndicatorBuilder: (ctx, url, downloadProgress) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  value: downloadProgress.progress,
                  strokeWidth: 2.5,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xFF0E0E11),
                    AppColors.black.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 15.w,
            top: 27.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                    ),
                    8.horizontalSpace,
                    const CustomText(
                      'RedBull',
                    ),
                  ],
                ),
                8.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.deepGreen,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: CustomText(tournament.entryFee == 0 ? 'Free' : 'Paid')
                      .paddingSymmetric(horizontal: 8.w, vertical: 2.h),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 27.5.h,
            left: 15.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  tournament.name,
                  style: AppTextStyles.regularMax,
                ),
                5.verticalSpace,
                Row(
                  children: [
                    ClipOval(
                      child: CustomCacheImage(
                        imageUrl: tournament.games[0].image,
                        height: 30,
                        loaderStrokeWidth: 2,
                        width: 30,
                      ),
                    ),
                    4.horizontalSpace,
                    CustomText(
                      tournament.games[0].name,
                    ),
                  ],
                ),
                5.verticalSpace,
                CustomText(
                  tournament.type,
                  color: AppColors.white.withOpacity(0.5),
                ),
                7.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(AppImages.calendar),
                    8.horizontalSpace,
                    CustomText(
                      duration,
                      style: AppTextStyles.regular.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: CustomText(
                        tournament.status,
                        style: AppTextStyles.light
                            .copyWith(color: AppColors.black),
                      ).paddingSymmetric(horizontal: 8.w, vertical: 2.h),
                    ),
                    16.horizontalSpace,
                    CustomText(
                      'N${tournament.entryFee}',
                    ),
                  ],
                ),
                22.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomElevatedButton(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 4.h,
                        bottom: 4.h,
                      ),
                      onPressed: () {},
                      title: 'Join',
                    ),
                    7.horizontalSpace,
                    SvgPicture.asset(AppImages.people),
                    15.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText('${tournament.teamSize} Participants'),
                        CustomText(
                          '${tournament.slots} slots remaining',
                          style: AppTextStyles.regularMini.copyWith(
                              color: AppColors.white.withOpacity(0.5)),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
