import 'package:flutter/material.dart';
import 'package:gamr/controllers/profile_controller/profile_controller.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/handlers/http_error.dart';
import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/models/requests/requests.dart';
import 'package:gamr/models/responses/responses.dart';
import 'package:gamr/services/account_service.dart';
import 'package:gamr/services/secure_storage_service.dart';
import 'package:gamr/services/storage_service.dart';
import 'package:gamr/ui/utils/utils.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // helpers
  bool showPassword = false;
  RxBool isLoggingIn = false.obs;

  Future<void> loginUser() async {
    // build the request here
    final LoginRequest loginRequest = LoginRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    isLoggingIn(true);

    // login the current user
    final ApiResponse<LoginResponse> res =
        await AccountService.getInstance.login(loginRequest);

    if (res is HttpSuccessResponse<LoginResponse>) {
      // save the token to a secured storage
      await Get.find<SecureStorage>()
          .write(path: userToken, value: res.data!.data.token);

      await Get.find<AppStorage>().setBool(isLoggedIn, true);

      // set user has logged in and call init to fetch user data
      Get.find<ProfileController>().onInit();
    } else if (res is HttpErrorResponse<LoginResponse>) {
      UiUtils.showStandardErrorFlushBar(
        message: HttpErrorUtils.getErrorMessage(res.error),
      );
    }

    isLoggingIn(false);
  }
}
