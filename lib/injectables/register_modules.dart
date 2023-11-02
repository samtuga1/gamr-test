import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gamr/config/global_env.config.dart';
import 'package:gamr/controllers/home_controller/home_controller.dart';
import 'package:gamr/controllers/login_controller/login_controller.dart';
import 'package:gamr/controllers/profile_controller/profile_controller.dart';
import 'package:gamr/services/secure_storage_service.dart';
import 'package:gamr/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> configureDependencies() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // this is used to configure the app data that will be needed in the app
  Get.put(GlobalConfiguration(), permanent: true);
  Get.put(SecureStorage(secureStorage), permanent: true);
  // Get.lazyPut(() => prefs);
  Get.put(AppStorage(prefs), permanent: true);

  final profileController = Get.put<ProfileController>(ProfileController());
  if (!profileController.userIsLoggedIn.value) {
    Get.put<LoginController>(LoginController());
  }
  Get.put<HomeController>(HomeController());
}
