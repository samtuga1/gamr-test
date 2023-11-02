import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gamr/data/app_textstyles.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/models/data/data.dart';
import 'package:gamr/models/data/tournament_info.dart';
import 'package:gamr/ui/widgets/widgets.dart';
import 'package:gamr/utils/extensions.dart';
import 'package:get/get.dart';

class TornamentOverview extends StatelessWidget {
  const TornamentOverview({super.key, required this.tournament});
  final TournamentInfo tournament;

  @override
  Widget build(BuildContext context) {
    // time span for the tournament
    String duration =
        '${(tournament.result.startedAt).day.toOrdinal()} - ${(tournament.result.endedAt).day.toOrdinal()} ${tournament.result.endedAt.month.monthInWords()}';

    // check if stating and ending date of time span is the same or not
    if (tournament.result.startedAt.month != tournament.result.endedAt.month) {
      duration =
          '${(tournament.result.startedAt).day.toOrdinal()} ${tournament.result.endedAt.month.monthInWords()} - ${(tournament.result.endedAt).day.toOrdinal()} ${tournament.result.endedAt.month.monthInWords()}';
    }

    DateTime startDate = tournament.result.startedAt;
    DateTime endDate = tournament.result.endedAt;

    String durationStatus = DateTime.now().isBefore(startDate)
        ? 'Not started'
        : (DateTime.now().isAfter(startDate) &&
                DateTime.now().isBefore(endDate))
            ? 'Ongoing'
            : 'Ended';

    // sort the prizes based on the rank
    List<Prize> prizes = List.from(tournament.result.prizes);
    prizes.sort((a, b) => a.rank.compareTo(b.rank));

    print(tournament.result.startedAt);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      children: [
        30.verticalSpace,
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            'General Information',
            style: AppTextStyles.regular.copyWith(fontSize: 16.sp),
          ),
        ),
        12.verticalSpace,
        25.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.people),
                    15.horizontalSpace,
                    Column(
                      children: [
                        CustomText(
                          '${tournament.result.teamSize} Participants',
                        ),
                        CustomText(
                          '${tournament.result.slots} slots remaining',
                          style: AppTextStyles.regularMini.copyWith(
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      'Entry type:',
                      style: AppTextStyles.regularMini,
                    ),
                    8.horizontalSpace,
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.deepGreen,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: CustomText(
                        tournament.result.entryFee == 0 ? "Free" : "Paid",
                        style: AppTextStyles.regular.copyWith(fontSize: 12.sp),
                      ),
                    )
                  ],
                )
              ],
            ),
            12.verticalSpace,
            CustomText(
              'Location',
              style: AppTextStyles.regular.copyWith(fontSize: 16.sp),
            ),
            4.verticalSpace,
            CustomText(
              tournament.result.location,
              style: AppTextStyles.light,
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.calendar,
                        ),
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
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: CustomText(
                        durationStatus,
                        style: AppTextStyles.regular
                            .copyWith(color: AppColors.black, fontSize: 12.sp),
                      ).paddingSymmetric(horizontal: 8.w, vertical: 2.h),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomText(
                      'Starts in :',
                      style: AppTextStyles.regular.copyWith(fontSize: 12.sp),
                    ),
                    CustomText(
                      '${DateTime.now().subtract(Duration(days: tournament.result.startedAt.day)).day} Days',
                      style: AppTextStyles.regular.copyWith(
                        color: AppColors.palePurple,
                        fontSize: 18.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
            24.verticalSpace,
            CustomText(
              'About',
              style: AppTextStyles.regularMax,
            ),
            8.verticalSpace,
            CustomText(
              "Gamr X Apex Legend tournament is an esports event that features professional players from around the world competing against each other in the popular battle royale game, Apex Legends. The tournament is organized by Gamr X and offers a significant prize pool to the winning team. The competition typically lasts for several days and includes various rounds with different modes of gameplay. Fans can follow the action through live streaming on popular platforms such as Twitch or YouTube, where expert commentators provide analysis and insights into the game's mechanics and strategies employed by top players. Additionally, participants get a chance to showcase their skills, learn from experienced gamers and earn recognition among the gaming community.",
              style: AppTextStyles.light,
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w),
        30.verticalSpace,
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            'Prize Pool',
            style: AppTextStyles.regular.copyWith(fontSize: 16.sp),
          ),
        ),
        30.verticalSpace,
        Column(
          children: prizes
              .map((e) => _prizeWidget(prize: e.value, rank: e.rank))
              .toList(),
        ).paddingSymmetric(horizontal: 15.w),
        30.verticalSpace,
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            'Tournament Rules',
            style: AppTextStyles.regular.copyWith(fontSize: 16.sp),
          ),
        ),
        30.verticalSpace,
        HtmlWidget(
          tournament.result.rules,
          textStyle: AppTextStyles.light,
        ),
        30.verticalSpace,
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            'About Organizer',
            style: AppTextStyles.regular.copyWith(fontSize: 16.sp),
          ),
        ),
        30.verticalSpace,
        Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 27,
                ),
                8.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Redbull',
                      style: AppTextStyles.regularMax.copyWith(fontSize: 20.sp),
                    ),
                    4.verticalSpace,
                    CustomText(
                      '15.5k Participants',
                      style: AppTextStyles.regularMini
                          .copyWith(color: AppColors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
            15.5.verticalSpace,
            CustomText(
              '''1. Redbull Esports presents "The Rush" - a series of competitive tournaments featuring various games and large prize pools. Join now to compete against the best!
2. Are you ready for the ultimate esports challenge? Join Redbull's online tournaments and put your skills to the test.
3. Looking for intense competition? Check out Redbull's Proving Grounds tournament circuit, where gamers battle it out in high-stakes matches.
4. Want to be part of a community that loves gaming as much as you do? Look no further than Redbull Gaming, where players from all over come together to compete and connect.
5. Get ready for some action-packed gameplay with Redbull's Signature Series tournaments! Compete against other top players from around the world.
6. Calling all gamers! Take on some of the toughest challenges in esports by signing up for one of Redbull's upcoming tournaments today.
7. Whether you're into MOBAs or FPS games, there's something for everyone at Redbull Gaming! Sign up now and start competing.
8. Ready to take your gaming skills to the next level? Join one of Redbull's legendary esports events and show off what you've got!
9. With massive prize pools and incredible atmosphere, there’s nothing quite like a live event hosted by Redbull Gaming – join us soon!
10. From amateur leagues to major championships, get involved in grassroots esports with our partner: @RedBullGaming Australia
''',
              style: AppTextStyles.light,
            ).paddingSymmetric(horizontal: 10.w),
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ],
    );
  }

  Widget _prizeWidget({required int rank, required int prize}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppImages.prize),
                8.horizontalSpace,
                CustomText(
                  rank.toOrdinal(),
                  style: AppTextStyles.regular.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
            CustomText(
              '$prize',
              style: AppTextStyles.regular.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
        Divider(
          color: AppColors.white.withOpacity(0.15000000596046448),
          height: 20,
        ),
      ],
    );
  }
}
