import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamr/config/config.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/injectables/injectables.dart';
import 'package:gamr/router/router.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void mainCommon(String envConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniLinksService.init();
  await GlobalConfiguration().loadFromAsset(envConfig);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp(
        title: 'gamr',
        initialRoute: Routes.initial,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          useMaterial3: true,
        ),
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
