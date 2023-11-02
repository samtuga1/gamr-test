import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/controllers/login_controller/login_controller.dart';
import 'package:gamr/ui/widgets/widgets.dart';
import 'package:gamr/utils/utils.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(20)),
            children: [
              50.verticalSpace,
              CustomText(
                'Log into your account',
                style: AppTextStyles.regularMax,
                fontWeight: FontWeight.w400,
                // fontSize: Dimens.fontSize22,
              ),
              20.verticalSpace,
              const CustomText(
                'Please enter your email address and password',
                // textColor: AppColors.tinyDark,
                fontWeight: FontWeight.w400,
                // fontSize: Dimens.fontSize14,
              ),
              20.verticalSpace,
              CustomTextFieldWidget(
                controller: controller.emailController,
                hintText: 'Enter your email address',
                validator: (value) => Validators.validateEmail(value),
              ),
              20.verticalSpace,
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return CustomTextFieldWidget(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    maxLines: 1,
                    obscureText: controller.showPassword,
                    suffixIcon: IconButton(
                      // color: AppColors.hintShaft,
                      onPressed: () {
                        setState(() {
                          controller.showPassword = !controller.showPassword;
                        });
                      },
                      icon: Icon(
                        controller.showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20.w,
                      ),
                    ),
                  );
                },
              ),
              20.verticalSpace,
              Obx(
                () => CustomElevatedButton(
                  title: 'Login',
                  isBusy: controller.isLoggingIn.value,
                  onPressed: () {
                    controller.loginUser();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
