import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/ui/screens/home/widgets/tornaments_content.dart';
import 'package:gamr/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          bottomHeight: 40.h,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _tabIcon(
                      context: context,
                      icon: AppImages.tornament_icon,
                      index: 0,
                    ),
                    10.horizontalSpace,
                    const CustomText('Tournaments'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _tabIcon(
                      context: context,
                      icon: AppImages.feeds_icon,
                      index: 1,
                    ),
                    10.horizontalSpace,
                    const CustomText('Feeds'),
                  ],
                ),
              ),
            ],
            dividerColor: AppColors.scaffoldBackgroundColor,
            indicatorWeight: 1,
            indicatorColor: AppColors.red,
          ),
        ),
        body: TabBarView(
          children: [
            const TournamentsContent(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget _tabIcon({
    required BuildContext context,
    required int index,
    required String icon,
  }) {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        int currentTabIndex = DefaultTabController.of(context).index;

        int previousIndex = DefaultTabController.of(context).previousIndex;

        Color tabIconColor =
            currentTabIndex == index ? AppColors.red : AppColors.white;

        DefaultTabController.of(context).addListener(() {
          // toggle the color of the selected index
          if (previousIndex != currentTabIndex) {
            setState(() {});
          }
        });

        return SvgPicture.asset(
          icon,
          color: tabIconColor,
        );
      },
    );
  }
}
