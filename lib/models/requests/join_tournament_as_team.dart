class JoinTournamentAsTeamRequest {
  final String tournamentSlug;
  final String? seed;
  final String team;
  final String? invitation;

  JoinTournamentAsTeamRequest({
    required this.tournamentSlug,
    this.seed,
    required this.team,
    this.invitation,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toJson = {
      "tournament": tournamentSlug,
      'team': team,
    };

    if (seed != null) {
      toJson['seed'] = seed;
    }

    if (invitation != null) {
      toJson['invitation'] = invitation;
    }
    return toJson;
  }
}
