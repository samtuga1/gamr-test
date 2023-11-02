import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamr/controllers/tournament_detail_controller/tournament_detail_controller.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/ui/screens/tornament_detail/widgets/overview.dart';
import 'package:gamr/ui/utils/share_tornament_dialog.dart';
import 'package:gamr/ui/widgets/widgets.dart';
import 'package:get/get.dart';

class TornamentDetailScreen extends GetView<TournamentDetailController> {
  const TornamentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: controller.obx(
        (tournament) => Scaffold(
          appBar: CustomAppBar(
            bottomHeight: MediaQuery.sizeOf(context).height * 0.45,
            bottom: SizedBox(
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.45,
                    width: double.infinity,
                    child: CustomCacheImage(
                      imageUrl: tournament?.result.banner ?? '',
                      height: null,
                      width: null,
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
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7.r),
                          child: CustomCacheImage(
                            imageUrl: tournament!.result.banner,
                            height: 84.h,
                            width: 80.w,
                            progressIndicatorBuilder: (p0, p1, p2) =>
                                const Center(
                              child: CustomLoading(),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        CustomText(
                          tournament.result.name,
                          style: AppTextStyles.regularMax,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Game',
                                  style: AppTextStyles.regularMini.copyWith(
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                ),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CustomCacheImage(
                                        imageUrl:
                                            tournament.result.games[0].image,
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                    ),
                                    4.horizontalSpace,
                                    CustomText(tournament.result.games[0].name),
                                  ],
                                ),
                              ],
                            ),
                            12.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Tournament organizer',
                                  style: AppTextStyles.regularMini.copyWith(
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 10,
                                    ),
                                    4.horizontalSpace,
                                    const CustomText('Apex Legends'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Price pool',
                                  style: AppTextStyles.regularMini.copyWith(
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImages.prize_pool),
                                    4.horizontalSpace,
                                    CustomText(
                                      '${tournament.result.currency}${tournament.result.prizePool}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            15.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Participants',
                                  style: AppTextStyles.regularMini.copyWith(
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImages.participants),
                                    4.horizontalSpace,
                                    CustomText(
                                      '${tournament.result.data.participantsCount}/${tournament.result.slots}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            15.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Platform',
                                  style: AppTextStyles.regularMini.copyWith(
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImages.playstation),
                                    4.horizontalSpace,
                                    const CustomText(
                                      'Playstation 5',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Obx(
                                () => CustomElevatedButton(
                                  isBusy: controller.isJoiningTournament.isTrue,
                                  onPressed: () =>
                                      controller.state!.result.isSolo
                                          ? controller.joinTournamentAsSolo()
                                          : controller.joinTournamentAsTeam(),
                                  title: 'Join Tournament',
                                  buttonColor: AppColors.deepRed,
                                ),
                              ),
                            ),
                            16.horizontalSpace,
                            Flexible(
                              flex: 1,
                              child: CustomElevatedButton(
                                onPressed: () => shareTornamentDialog(),
                                titleWidget: Row(
                                  children: [
                                    const Icon(
                                      Icons.share,
                                      size: 16,
                                      color: AppColors.white,
                                    ),
                                    8.horizontalSpace,
                                    const CustomText('Share'),
                                  ],
                                ),
                                buttonColor: AppColors.white
                                    .withOpacity(0.10000000149011612),
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 42.w),
                        const TabBar(
                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.tinyGrey,
                          tabs: [
                            Tab(
                              text: 'Overview',
                            ),
                            Tab(
                              text: 'Brackets',
                            ),
                            Tab(
                              text: 'Participants',
                            ),
                            Tab(
                              text: 'Gameplays',
                            ),
                          ],
                          dividerColor: AppColors.scaffoldBackgroundColor,
                          indicatorWeight: 1,
                          indicatorColor: AppColors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            TornamentOverview(
              tournament: tournament,
            ),
            Container(),
            Container(),
            Container(),
          ]),
        ),
        onLoading: Material(
          type: MaterialType.transparency,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const Center(
              child: CustomLoading(),
            ),
          ),
        ),
        onError: (error) => Material(
          type: MaterialType.transparency,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(error ?? 'An error occured'),
                  const CustomText('Click to try again'),
                  CustomElevatedButton(
                    onPressed: () {
                      controller.getTournament();
                    },
                    title: 'Try again',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
