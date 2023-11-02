import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamr/controllers/home_controller/home_controller.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/ui/screens/home/widgets/tornament_card.dart';
import 'package:gamr/ui/widgets/widgets.dart';
import 'package:get/get.dart';

class TournamentsContent extends GetView<HomeController> {
  const TournamentsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          43.verticalSpace,
          controller.obx(
            (tournaments) => FlutterCarousel(
              options: CarouselOptions(
                floatingIndicator: false,
                showIndicator: false,
                aspectRatio: 21 / 23,
              ),
              items: tournaments!.map((tournament) {
                return Builder(
                  builder: (BuildContext context) {
                    return TornamentCard(
                      tournament: tournament,
                    ).paddingOnly(right: 10);
                  },
                );
              }).toList(),
            ),
            onLoading: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: const Center(
                child: CustomLoading(),
              ),
            ),
            onError: (error) => SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(error ?? 'An error occured'),
                    const CustomText('Click to try again'),
                    CustomElevatedButton(
                      onPressed: () {
                        controller.listTournaments();
                      },
                      title: 'Try again',
                    )
                  ],
                ),
              ),
            ),
          ),
          18.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText('120 Tornaments'),
              CustomAdaptiveTextButton(
                onTap: () {},
                text: 'View All',
                style: AppTextStyles.regularMini.copyWith(
                  color: AppColors.white.withOpacity(0.5199999809265137),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 26.w),
        ],
      ),
    );
  }
}
