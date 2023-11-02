import 'package:gamr/data/data.dart';
import 'package:gamr/handlers/http_error.dart';
import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/models/data/user_model.dart';
import 'package:gamr/services/account_service.dart';
import 'package:gamr/services/storage_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<UserData> {
  RxBool userIsLoggedIn = false.obs;
  AppStorage prefs = Get.find<AppStorage>();

  @override
  onInit() async {
    userIsLoggedIn(await Get.find<AppStorage>().getBool(isLoggedIn));

    if (userIsLoggedIn.value) {
      getUserData();
    }

    super.onInit();
  }

  Future<void> getUserData() async {
    change(null, status: RxStatus.loading());

    // login the current user
    final ApiResponse<UserData> res =
        await AccountService.getInstance.fetchUserData();

    if (res is HttpSuccessResponse<UserData>) {
      // set user data here
      change(res.data, status: RxStatus.success());
    } else if (res is HttpErrorResponse<UserData>) {
      change(
        null,
        status: RxStatus.error(
          HttpErrorUtils.getErrorMessage(res.error),
        ),
      );
    }
  }
}
