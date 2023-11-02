import 'package:gamr/handlers/http_error.dart';
import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/models/data/data.dart';
import 'package:gamr/services/tournament_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<Tournament>> {
  @override
  void onInit() {
    listTournaments();
    super.onInit();
  }

  Future<void> listTournaments() async {
    change(null, status: RxStatus.loading());

    // fetch list of tournaments
    final ApiResponse<List<Tournament>> res =
        await TournamentService.instance.listTournaments();

    if (res is HttpSuccessResponse<List<Tournament>>) {
      change(res.data, status: RxStatus.success());
    } else if (res is HttpErrorResponse<List<Tournament>>) {
      change(
        null,
        status: RxStatus.error(
          HttpErrorUtils.getErrorMessage(res.error),
        ),
      );
    }
  }
}
