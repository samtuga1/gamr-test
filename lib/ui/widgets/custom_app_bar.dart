import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/models/data/data.dart';
import 'package:gamr/repositories/user.repository.dart';
import 'package:gamr/ui/widgets/widgets.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({
    super.key,
    this.title = '',
    this.leadingPhoto = '',
    this.bottom,
    this.subtitle = '',
    this.bottomHeight = 0,
  }) : super(
          child: const SizedBox.shrink(),
          preferredSize: Size.fromHeight(
            bottom == null
                ? kToolbarHeight + 20
                : (kToolbarHeight + 20) + bottomHeight,
          ),
        );
  final String title;
  final double bottomHeight;
  final String subtitle;
  final Widget? bottom;
  final String leadingPhoto;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 400,
      leadingWidth: 60,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: bottom ?? child,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.search),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.notifications),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.rating),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: ClipOval(
            child: FutureBuilder(
              future: UserRepo().getUser(),
              builder:
                  (BuildContext context, AsyncSnapshot<UserData?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomCacheImage(
                    height: 50,
                    width: 50,
                    imageUrl: '',
                  );
                }
                return CustomCacheImage(
                  height: 50,
                  width: 50,
                  imageUrl: snapshot.data?.data.avatar ?? '',
                );
              },
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            'Hi Samuel',
            color: AppColors.white.withOpacity(0.5),
          ),
          Row(
            children: [
              CustomText(
                '2000NGN',
                style: AppTextStyles.regularMini,
              ),
              3.horizontalSpace,
              SvgPicture.asset(
                AppImages.coins,
                width: 24.w,
                height: 20.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
