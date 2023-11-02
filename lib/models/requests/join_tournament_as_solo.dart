class JoinTournamentAsSoloRequest {
  final String tournamentSlug;
  final String? seed;
  final String? username;
  final String? invitation;

  JoinTournamentAsSoloRequest({
    required this.tournamentSlug,
    this.seed,
    this.username,
    this.invitation,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toJson = {
      "tournament": tournamentSlug,
    };

    if (seed != null) {
      toJson['seed'] = seed;
    }
    if (username != null) {
      toJson['username'] = username;
    }
    if (invitation != null) {
      toJson['invitation'] = invitation;
    }
    return toJson;
  }
}
