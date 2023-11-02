import 'package:gamr/models/data/event.dart';
import 'package:gamr/models/data/tournament.dart';

class TournamentInfo {
  final String status;
  final Data result;

  TournamentInfo({
    required this.status,
    required this.result,
  });

  factory TournamentInfo.fromJson(Map<String, dynamic> json) => TournamentInfo(
        status: json["status"],
        result: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": result.toJson(),
      };
}

class Data {
  final Event event;
  final List<Game> games;
  final List<Prize> prizes;
  final Data2 data;
  final bool isOrganizer;
  final String name;
  final String type;
  final String banner;
  final int entryFee;
  final String currency;
  final int teamSize;
  final int slots;
  final int prizePool;
  final String location;
  final String rules;
  final String? lat;
  final String? lng;
  final String status;
  final List<String> actions;
  final bool isSolo;
  final bool isPublic;
  final bool isExclusive;
  final DateTime startedAt;
  final DateTime endedAt;
  final DateTime publishedAt;
  final String slug;

  Data({
    required this.event,
    required this.games,
    required this.prizes,
    required this.isOrganizer,
    required this.name,
    required this.type,
    required this.banner,
    required this.entryFee,
    required this.currency,
    required this.teamSize,
    required this.slots,
    required this.prizePool,
    required this.location,
    required this.rules,
    required this.lat,
    required this.lng,
    required this.status,
    required this.actions,
    required this.isSolo,
    required this.isPublic,
    required this.data,
    required this.isExclusive,
    required this.startedAt,
    required this.endedAt,
    required this.publishedAt,
    required this.slug,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        event: Event.fromJson(json["event"]),
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
        prizes: List<Prize>.from(json["prizes"].map((x) => Prize.fromJson(x))),
        isOrganizer: json["is_organizer"],
        name: json["name"],
        type: json["type"],
        banner: json["banner"],
        entryFee: json["entry_fee"],
        currency: json["currency"],
        teamSize: json["team_size"],
        slots: json["slots"],
        prizePool: json["prize_pool"],
        location: json["location"],
        rules: json["rules"],
        lat: json["lat"],
        data: Data2.fromJson(json['data']),
        lng: json["lng"],
        status: json["status"],
        actions: List<String>.from(json["actions"].map((x) => x)),
        isSolo: json["is_solo"],
        isPublic: json["is_public"],
        isExclusive: json["is_exclusive"],
        startedAt: DateTime.parse(json["started_at"]),
        endedAt: DateTime.parse(json["ended_at"]),
        publishedAt: DateTime.parse(json["published_at"]),
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "event": event.toJson(),
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
        "prizes": List<dynamic>.from(prizes.map((x) => x.toJson())),
        "is_organizer": isOrganizer,
        "name": name,
        "type": type,
        "banner": banner,
        "entry_fee": entryFee,
        "currency": currency,
        "team_size": teamSize,
        "slots": slots,
        "prize_pool": prizePool,
        "location": location,
        "rules": rules,
        "lat": lat,
        "lng": lng,
        "status": status,
        "actions": List<dynamic>.from(actions.map((x) => x)),
        "is_solo": isSolo,
        "is_public": isPublic,
        "is_exclusive": isExclusive,
        "started_at": startedAt.toIso8601String(),
        "ended_at": endedAt.toIso8601String(),
        "published_at": publishedAt.toIso8601String(),
        "slug": slug,
      };
}

class Data2 {
  final int id;
  final String name;
  final String url;
  final String description;
  final String tournamentType;
  final dynamic startedAt;
  final dynamic completedAt;
  final bool requireScoreAgreement;
  final bool notifyUsersWhenMatchesOpen;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String state;
  final bool openSignup;
  final bool notifyUsersWhenTheTournamentEnds;
  final int progressMeter;
  final bool quickAdvance;
  final bool holdThirdPlaceMatch;
  final String ptsForGameWin;
  final String ptsForGameTie;
  final String ptsForMatchWin;
  final String ptsForMatchTie;
  final String ptsForBye;
  final int swissRounds;
  final bool private;
  final String rankedBy;
  final bool showRounds;
  final bool hideForum;
  final bool sequentialPairings;
  final bool acceptAttachments;
  final String rrPtsForGameWin;
  final String rrPtsForGameTie;
  final String rrPtsForMatchWin;
  final String rrPtsForMatchTie;
  final bool createdByApi;
  final bool creditCapped;
  final dynamic category;
  final bool hideSeeds;
  final int predictionMethod;
  final dynamic predictionsOpenedAt;
  final bool anonymousVoting;
  final int maxPredictionsPerUser;
  final int signupCap;
  final dynamic gameId;
  final int participantsCount;
  final bool groupStagesEnabled;
  final bool allowParticipantMatchReporting;
  final dynamic teams;
  final int checkInDuration;
  final DateTime startAt;
  final dynamic startedCheckingInAt;
  final dynamic tieBreaks;
  final dynamic lockedAt;
  final dynamic eventId;
  final dynamic publicPredictionsBeforeStartTime;
  final bool ranked;
  final dynamic grandFinalsModifier;
  final dynamic predictTheLosersBracket;
  final dynamic spam;
  final dynamic ham;
  final dynamic rrIterations;
  final dynamic tournamentRegistrationId;
  final dynamic donationContestEnabled;
  final dynamic mandatoryDonation;
  final List<dynamic> nonEliminationTournamentData;
  final dynamic autoAssignStations;
  final dynamic onlyStartMatchesWithStations;
  final String registrationFee;
  final String registrationType;
  final bool splitParticipants;
  final dynamic allowedRegions;
  final dynamic showParticipantCountry;
  final dynamic programId;
  final dynamic programClassificationIdsAllowed;
  final dynamic teamSizeRange;
  final dynamic toxic;
  final dynamic useNewStyle;
  final OptionalDisplayData optionalDisplayData;
  final dynamic processing;
  final dynamic oauthApplicationId;
  final String descriptionSource;
  final dynamic subdomain;
  final String fullChallongeUrl;
  final String liveImageUrl;
  final dynamic signUpUrl;
  final bool reviewBeforeFinalizing;
  final bool acceptingPredictions;
  final bool participantsLocked;
  final dynamic gameName;
  final bool participantsSwappable;
  final bool teamConvertable;
  final bool groupStagesWereStarted;

  Data2({
    required this.id,
    required this.name,
    required this.url,
    required this.description,
    required this.tournamentType,
    required this.startedAt,
    required this.completedAt,
    required this.requireScoreAgreement,
    required this.notifyUsersWhenMatchesOpen,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.openSignup,
    required this.notifyUsersWhenTheTournamentEnds,
    required this.progressMeter,
    required this.quickAdvance,
    required this.holdThirdPlaceMatch,
    required this.ptsForGameWin,
    required this.ptsForGameTie,
    required this.ptsForMatchWin,
    required this.ptsForMatchTie,
    required this.ptsForBye,
    required this.swissRounds,
    required this.private,
    required this.rankedBy,
    required this.showRounds,
    required this.hideForum,
    required this.sequentialPairings,
    required this.acceptAttachments,
    required this.rrPtsForGameWin,
    required this.rrPtsForGameTie,
    required this.rrPtsForMatchWin,
    required this.rrPtsForMatchTie,
    required this.createdByApi,
    required this.creditCapped,
    required this.category,
    required this.hideSeeds,
    required this.predictionMethod,
    required this.predictionsOpenedAt,
    required this.anonymousVoting,
    required this.maxPredictionsPerUser,
    required this.signupCap,
    required this.gameId,
    required this.participantsCount,
    required this.groupStagesEnabled,
    required this.allowParticipantMatchReporting,
    required this.teams,
    required this.checkInDuration,
    required this.startAt,
    required this.startedCheckingInAt,
    required this.tieBreaks,
    required this.lockedAt,
    required this.eventId,
    required this.publicPredictionsBeforeStartTime,
    required this.ranked,
    required this.grandFinalsModifier,
    required this.predictTheLosersBracket,
    required this.spam,
    required this.ham,
    required this.rrIterations,
    required this.tournamentRegistrationId,
    required this.donationContestEnabled,
    required this.mandatoryDonation,
    required this.nonEliminationTournamentData,
    required this.autoAssignStations,
    required this.onlyStartMatchesWithStations,
    required this.registrationFee,
    required this.registrationType,
    required this.splitParticipants,
    required this.allowedRegions,
    required this.showParticipantCountry,
    required this.programId,
    required this.programClassificationIdsAllowed,
    required this.teamSizeRange,
    required this.toxic,
    required this.useNewStyle,
    required this.optionalDisplayData,
    required this.processing,
    required this.oauthApplicationId,
    required this.descriptionSource,
    required this.subdomain,
    required this.fullChallongeUrl,
    required this.liveImageUrl,
    required this.signUpUrl,
    required this.reviewBeforeFinalizing,
    required this.acceptingPredictions,
    required this.participantsLocked,
    required this.gameName,
    required this.participantsSwappable,
    required this.teamConvertable,
    required this.groupStagesWereStarted,
  });

  factory Data2.fromJson(Map<String, dynamic> json) => Data2(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        tournamentType: json["tournament_type"],
        startedAt: json["started_at"],
        completedAt: json["completed_at"],
        requireScoreAgreement: json["require_score_agreement"],
        notifyUsersWhenMatchesOpen: json["notify_users_when_matches_open"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        state: json["state"],
        openSignup: json["open_signup"],
        notifyUsersWhenTheTournamentEnds:
            json["notify_users_when_the_tournament_ends"],
        progressMeter: json["progress_meter"],
        quickAdvance: json["quick_advance"],
        holdThirdPlaceMatch: json["hold_third_place_match"],
        ptsForGameWin: json["pts_for_game_win"],
        ptsForGameTie: json["pts_for_game_tie"],
        ptsForMatchWin: json["pts_for_match_win"],
        ptsForMatchTie: json["pts_for_match_tie"],
        ptsForBye: json["pts_for_bye"],
        swissRounds: json["swiss_rounds"],
        private: json["private"],
        rankedBy: json["ranked_by"],
        showRounds: json["show_rounds"],
        hideForum: json["hide_forum"],
        sequentialPairings: json["sequential_pairings"],
        acceptAttachments: json["accept_attachments"],
        rrPtsForGameWin: json["rr_pts_for_game_win"],
        rrPtsForGameTie: json["rr_pts_for_game_tie"],
        rrPtsForMatchWin: json["rr_pts_for_match_win"],
        rrPtsForMatchTie: json["rr_pts_for_match_tie"],
        createdByApi: json["created_by_api"],
        creditCapped: json["credit_capped"],
        category: json["category"],
        hideSeeds: json["hide_seeds"],
        predictionMethod: json["prediction_method"],
        predictionsOpenedAt: json["predictions_opened_at"],
        anonymousVoting: json["anonymous_voting"],
        maxPredictionsPerUser: json["max_predictions_per_user"],
        signupCap: json["signup_cap"],
        gameId: json["game_id"],
        participantsCount: json["participants_count"],
        groupStagesEnabled: json["group_stages_enabled"],
        allowParticipantMatchReporting:
            json["allow_participant_match_reporting"],
        teams: json["teams"],
        checkInDuration: json["check_in_duration"],
        startAt: DateTime.parse(json["start_at"]),
        startedCheckingInAt: json["started_checking_in_at"],
        tieBreaks: json["tie_breaks"],
        lockedAt: json["locked_at"],
        eventId: json["event_id"],
        publicPredictionsBeforeStartTime:
            json["public_predictions_before_start_time"],
        ranked: json["ranked"],
        grandFinalsModifier: json["grand_finals_modifier"],
        predictTheLosersBracket: json["predict_the_losers_bracket"],
        spam: json["spam"],
        ham: json["ham"],
        rrIterations: json["rr_iterations"],
        tournamentRegistrationId: json["tournament_registration_id"],
        donationContestEnabled: json["donation_contest_enabled"],
        mandatoryDonation: json["mandatory_donation"],
        nonEliminationTournamentData: List<dynamic>.from(
            json["non_elimination_tournament_data"].map((x) => x)),
        autoAssignStations: json["auto_assign_stations"],
        onlyStartMatchesWithStations: json["only_start_matches_with_stations"],
        registrationFee: json["registration_fee"],
        registrationType: json["registration_type"],
        splitParticipants: json["split_participants"],
        allowedRegions: json["allowed_regions"],
        showParticipantCountry: json["show_participant_country"],
        programId: json["program_id"],
        programClassificationIdsAllowed:
            json["program_classification_ids_allowed"],
        teamSizeRange: json["team_size_range"],
        toxic: json["toxic"],
        useNewStyle: json["use_new_style"],
        optionalDisplayData:
            OptionalDisplayData.fromJson(json["optional_display_data"]),
        processing: json["processing"],
        oauthApplicationId: json["oauth_application_id"],
        descriptionSource: json["description_source"],
        subdomain: json["subdomain"],
        fullChallongeUrl: json["full_challonge_url"],
        liveImageUrl: json["live_image_url"],
        signUpUrl: json["sign_up_url"],
        reviewBeforeFinalizing: json["review_before_finalizing"],
        acceptingPredictions: json["accepting_predictions"],
        participantsLocked: json["participants_locked"],
        gameName: json["game_name"],
        participantsSwappable: json["participants_swappable"],
        teamConvertable: json["team_convertable"],
        groupStagesWereStarted: json["group_stages_were_started"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "tournament_type": tournamentType,
        "started_at": startedAt,
        "completed_at": completedAt,
        "require_score_agreement": requireScoreAgreement,
        "notify_users_when_matches_open": notifyUsersWhenMatchesOpen,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "state": state,
        "open_signup": openSignup,
        "notify_users_when_the_tournament_ends":
            notifyUsersWhenTheTournamentEnds,
        "progress_meter": progressMeter,
        "quick_advance": quickAdvance,
        "hold_third_place_match": holdThirdPlaceMatch,
        "pts_for_game_win": ptsForGameWin,
        "pts_for_game_tie": ptsForGameTie,
        "pts_for_match_win": ptsForMatchWin,
        "pts_for_match_tie": ptsForMatchTie,
        "pts_for_bye": ptsForBye,
        "swiss_rounds": swissRounds,
        "private": private,
        "ranked_by": rankedBy,
        "show_rounds": showRounds,
        "hide_forum": hideForum,
        "sequential_pairings": sequentialPairings,
        "accept_attachments": acceptAttachments,
        "rr_pts_for_game_win": rrPtsForGameWin,
        "rr_pts_for_game_tie": rrPtsForGameTie,
        "rr_pts_for_match_win": rrPtsForMatchWin,
        "rr_pts_for_match_tie": rrPtsForMatchTie,
        "created_by_api": createdByApi,
        "credit_capped": creditCapped,
        "category": category,
        "hide_seeds": hideSeeds,
        "prediction_method": predictionMethod,
        "predictions_opened_at": predictionsOpenedAt,
        "anonymous_voting": anonymousVoting,
        "max_predictions_per_user": maxPredictionsPerUser,
        "signup_cap": signupCap,
        "game_id": gameId,
        "participants_count": participantsCount,
        "group_stages_enabled": groupStagesEnabled,
        "allow_participant_match_reporting": allowParticipantMatchReporting,
        "teams": teams,
        "check_in_duration": checkInDuration,
        "start_at": startAt.toIso8601String(),
        "started_checking_in_at": startedCheckingInAt,
        "tie_breaks": tieBreaks,
        "locked_at": lockedAt,
        "event_id": eventId,
        "public_predictions_before_start_time":
            publicPredictionsBeforeStartTime,
        "ranked": ranked,
        "grand_finals_modifier": grandFinalsModifier,
        "predict_the_losers_bracket": predictTheLosersBracket,
        "spam": spam,
        "ham": ham,
        "rr_iterations": rrIterations,
        "tournament_registration_id": tournamentRegistrationId,
        "donation_contest_enabled": donationContestEnabled,
        "mandatory_donation": mandatoryDonation,
        "non_elimination_tournament_data":
            List<dynamic>.from(nonEliminationTournamentData.map((x) => x)),
        "auto_assign_stations": autoAssignStations,
        "only_start_matches_with_stations": onlyStartMatchesWithStations,
        "registration_fee": registrationFee,
        "registration_type": registrationType,
        "split_participants": splitParticipants,
        "allowed_regions": allowedRegions,
        "show_participant_country": showParticipantCountry,
        "program_id": programId,
        "program_classification_ids_allowed": programClassificationIdsAllowed,
        "team_size_range": teamSizeRange,
        "toxic": toxic,
        "use_new_style": useNewStyle,
        "optional_display_data": optionalDisplayData.toJson(),
        "processing": processing,
        "oauth_application_id": oauthApplicationId,
        "description_source": descriptionSource,
        "subdomain": subdomain,
        "full_challonge_url": fullChallongeUrl,
        "live_image_url": liveImageUrl,
        "sign_up_url": signUpUrl,
        "review_before_finalizing": reviewBeforeFinalizing,
        "accepting_predictions": acceptingPredictions,
        "participants_locked": participantsLocked,
        "game_name": gameName,
        "participants_swappable": participantsSwappable,
        "team_convertable": teamConvertable,
        "group_stages_were_started": groupStagesWereStarted,
      };
}

class OptionalDisplayData {
  final String showStandings;
  final bool showAnnouncements;

  OptionalDisplayData({
    required this.showStandings,
    required this.showAnnouncements,
  });

  factory OptionalDisplayData.fromJson(Map<String, dynamic> json) =>
      OptionalDisplayData(
        showStandings: json["show_standings"],
        showAnnouncements: json["show_announcements"],
      );

  Map<String, dynamic> toJson() => {
        "show_standings": showStandings,
        "show_announcements": showAnnouncements,
      };
}
