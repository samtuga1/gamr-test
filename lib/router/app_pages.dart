import 'package:gamr/controllers/tournament_detail_controller/tournament_detail_binding.dart';
import 'package:gamr/router/router.dart';
import 'package:gamr/ui/screens/screens.dart';
import 'package:gamr/ui/screens/tornament_detail/tornament_detail_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: Routes.initial,
      page: () => const BottomNavBar(),
    ),
    GetPage(
      name: Routes.tournament_detail,
      binding: TournamentDetailBinding(),
      transition: Transition.rightToLeftWithFade,
      page: () => const TornamentDetailScreen(),
    ),
  ];
}
