import 'package:gamr/handlers/http_error.dart';
import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/interfaces/tournament_service.interface.dart';
import 'package:gamr/models/data/tournament.dart';
import 'package:gamr/models/data/tournament_info.dart';
import 'package:gamr/models/requests/requests.dart';
import 'package:gamr/models/responses/responses.dart';
import 'package:gamr/services/base_service.dart';
import 'package:get/get.dart';

class TournamentService extends BaseApiService implements ITournamentService {
  static TournamentService? _instance;

  static TournamentService get instance {
    return _instance ??= TournamentService();
  }

  @override
  Future<ApiResponse<List<Tournament>>> listTournaments() async {
    super.onInit();

    try {
      Response response = await get('/tournaments');

      if (response.hasError) {
        throw response;
      }

      final jsonRes = List<Tournament>.from(response.body['data'].map(
        (json) => Tournament.fromJson(json),
      ));

      return HttpSuccessResponse<List<Tournament>>(data: jsonRes);
    } catch (err) {
      return HttpErrorResponse(
        error: HttpErrorUtils.getException(err),
      );
    }
  }

  @override
  Future<ApiResponse<TournamentInfo>> getTournament({
    required String slug,
  }) async {
    super.onInit();

    try {
      Response response = await get('/tournaments/show/$slug');

      if (response.hasError) {
        throw response;
      }

      final jsonRes = TournamentInfo.fromJson(response.body);

      return HttpSuccessResponse<TournamentInfo>(data: jsonRes);
    } catch (err) {
      return HttpErrorResponse(
        error: HttpErrorUtils.getException(err),
      );
    }
  }

  @override
  Future<ApiResponse<JoinTournamentResponse>> joinTournamentAsSolo(
    JoinTournamentAsSoloRequest request,
  ) async {
    super.onInit();

    try {
      Response response = await post('/participants/store', request.toJson());

      if (response.hasError) {
        throw response;
      }

      final jsonRes = JoinTournamentResponse.fromJson(response.body);

      return HttpSuccessResponse<JoinTournamentResponse>(data: jsonRes);
    } catch (err) {
      return HttpErrorResponse(
        error: HttpErrorUtils.getException(err),
      );
    }
  }

  @override
  Future<ApiResponse<JoinTournamentResponse>> joinTournamentAsTeam(
    JoinTournamentAsTeamRequest request,
  ) async {
    super.onInit();

    try {
      Response response = await post(
        '/participants/teams/store',
        request.toJson(),
      );

      if (response.hasError) {
        throw response;
      }

      final jsonRes = JoinTournamentResponse.fromJson(response.body);

      return HttpSuccessResponse<JoinTournamentResponse>(data: jsonRes);
    } catch (err) {
      return HttpErrorResponse(
        error: HttpErrorUtils.getException(err),
      );
    }
  }
}
