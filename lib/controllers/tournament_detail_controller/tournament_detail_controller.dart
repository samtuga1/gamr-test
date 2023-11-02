import 'package:gamr/handlers/http_error.dart';
import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/models/data/tournament_info.dart';
import 'package:gamr/models/requests/join_tournament_as_solo.dart';
import 'package:gamr/models/responses/responses.dart';
import 'package:gamr/services/tournament_service.dart';
import 'package:gamr/ui/utils/utils.dart';
import 'package:gamr/utils/utils.dart';
import 'package:get/get.dart';

import '../../models/requests/requests.dart';

class TournamentDetailController extends GetxController
    with StateMixin<TournamentInfo> {
  late String slug;

  RxBool isJoiningTournament = false.obs;

  @override
  void onInit() {
    slug = Get.arguments;
    getTournament();
    super.onInit();
  }

  void getTournament() async {
    change(null, status: RxStatus.loading());

    final ApiResponse<TournamentInfo> res =
        await TournamentService.instance.getTournament(slug: slug);

    if (res is HttpSuccessResponse<TournamentInfo>) {
      change(res.data, status: RxStatus.success());
    } else if (res is HttpErrorResponse<TournamentInfo>) {
      change(
        null,
        status: RxStatus.error(
          HttpErrorUtils.getErrorMessage(res.error),
        ),
      );
    }
  }

  Future<void> joinTournamentAsSolo() async {
    isJoiningTournament(true);

    final request =
        JoinTournamentAsSoloRequest(tournamentSlug: state!.result.slug);

    final ApiResponse<JoinTournamentResponse> res =
        await TournamentService.instance.joinTournamentAsSolo(request);

    if (res is HttpSuccessResponse<JoinTournamentResponse>) {
      isJoiningTournament(false);
      UiUtils.flush(
        msg: 'Successfully joined tournament',
        errorState: FlushState.success,
      );
    } else if (res is HttpErrorResponse<JoinTournamentResponse>) {
      isJoiningTournament(false);
      UiUtils.showStandardErrorFlushBar(
        message: HttpErrorUtils.getErrorMessage(res.error),
      );
    }
  }

  Future<void> joinTournamentAsTeam() async {
    isJoiningTournament(true);

    // TODO find out how to get the team slug
    final request = JoinTournamentAsTeamRequest(
        tournamentSlug: state!.result.slug, team: '');

    final ApiResponse<JoinTournamentResponse> res =
        await TournamentService.instance.joinTournamentAsTeam(request);

    if (res is HttpSuccessResponse<JoinTournamentResponse>) {
      isJoiningTournament(false);
      UiUtils.flush(
        msg: 'Successfully joined tournament',
        errorState: FlushState.success,
      );
    } else if (res is HttpErrorResponse<JoinTournamentResponse>) {
      isJoiningTournament(false);
      UiUtils.showStandardErrorFlushBar(
        message: HttpErrorUtils.getErrorMessage(res.error),
      );
    }
  }
}
