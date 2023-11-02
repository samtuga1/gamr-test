import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamr/controllers/profile_controller/profile_controller.dart';
import 'package:gamr/data/app_images.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/ui/screens/home/home_screen.dart';
import 'package:gamr/controllers/login_controller/login_controller.dart';
import 'package:gamr/ui/screens/profile/profile_screen.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pages = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    const ProfileScreen(),
  ];

  int currentTabIndex = 0;

  void switchPages(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTabIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: switchPages,
          backgroundColor: AppColors.scaffoldBackgroundColor,
          iconSize: 20,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.scaffoldBackgroundColor,
              icon: SvgPicture.asset(
                AppImages.home,
                color:
                    currentTabIndex == 0 ? AppColors.red : AppColors.inactive,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.tornament,
                color:
                    currentTabIndex == 1 ? AppColors.red : AppColors.inactive,
              ),
              label: 'Tornament',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.plus,
              ),
              label: 'Plus',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.marketplace,
                color:
                    currentTabIndex == 3 ? AppColors.red : AppColors.inactive,
              ),
              label: 'Marketplace',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.person,
                color:
                    currentTabIndex == 4 ? AppColors.red : AppColors.inactive,
              ),
              label: 'Person',
            ),
          ]),
    );
  }
}
