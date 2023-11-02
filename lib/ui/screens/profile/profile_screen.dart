import 'package:flutter/material.dart';
import 'package:gamr/controllers/profile_controller/profile_controller.dart';
import 'package:gamr/ui/screens/login/login_screen.dart';
import 'package:gamr/ui/screens/profile/widgets/profile_widget.dart';
import 'package:gamr/ui/widgets/widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1),
        child: controller.userIsLoggedIn.value
            ? controller.obx(
                (state) => ProfileWidget(userData: state!),
                onLoading: const Center(
                  child: CustomLoading(),
                ),
                onError: (error) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(error ?? 'An error occured'),
                      const CustomText('Click to try again'),
                      CustomElevatedButton(
                        onPressed: () {
                          controller.getUserData();
                        },
                        title: 'Try again',
                      )
                    ],
                  ),
                ),
              )
            : const LoginScreen(),
      ),
    );
  }
}
