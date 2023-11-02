import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/models/data/data.dart';
import 'package:gamr/models/data/tournament_info.dart';
import 'package:gamr/models/requests/requests.dart';
import 'package:gamr/models/responses/responses.dart';

abstract class ITournamentService {
  Future<ApiResponse<List<Tournament>>> listTournaments();
  Future<ApiResponse<TournamentInfo>> getTournament({required String slug});
  Future<ApiResponse<JoinTournamentResponse>> joinTournamentAsSolo(
    JoinTournamentAsSoloRequest request,
  );
  Future<ApiResponse<JoinTournamentResponse>> joinTournamentAsTeam(
    JoinTournamentAsTeamRequest request,
  );
}
