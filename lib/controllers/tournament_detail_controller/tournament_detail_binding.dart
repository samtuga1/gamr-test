import 'package:gamr/controllers/tournament_detail_controller/tournament_detail_controller.dart';
import 'package:get/get.dart';

class TournamentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TournamentDetailController>(TournamentDetailController());
  }
}
