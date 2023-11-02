class JoinTournamentResponse {
  final String status;
  final String message;
  final JoinTournamentResponseData data;

  JoinTournamentResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory JoinTournamentResponse.fromJson(Map<String, dynamic> json) =>
      JoinTournamentResponse(
        status: json["status"],
        message: json["message"],
        data: JoinTournamentResponseData.fromJson(json["data"]),
      );
}

class JoinTournamentResponseData {
  final String uuid;
  final DataData? data;
  final String status;
  final bool isSolo;
  final String joined;
  final int joinedAt;
  final DateTime? checkedInAt;

  JoinTournamentResponseData({
    required this.uuid,
    required this.data,
    required this.status,
    required this.joined,
    required this.joinedAt,
    required this.isSolo,
    required this.checkedInAt,
  });

  factory JoinTournamentResponseData.fromJson(Map<String, dynamic> json) =>
      JoinTournamentResponseData(
        uuid: json["uuid"],
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
        status: json["status"],
        joined: json["joined"],
        isSolo: json['is_solo'],
        joinedAt: json["joined_at"],
        checkedInAt: json["checked_in_at"] == null
            ? null
            : DateTime.parse(json["checked_in_at"]),
      );
}

class DataData {
  final int id;
  final int tournamentId;
  final String name;
  final int seed;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? inviteEmail;
  final dynamic finalRank;
  final String misc;
  final dynamic icon;
  final bool onWaitingList;
  final int invitationId;
  final int? groupId;
  final DateTime checkedInAt;
  final int? rankedMemberId;
  final dynamic customFieldResponse;
  final dynamic clinch;
  final dynamic integrationUids;
  final String? challongeUsername;
  final bool? challongeEmailAddressVerified;
  final bool removable;
  final bool participatableOrInvitationAttached;
  final bool confirmRemove;
  final bool invitationPending;
  final String displayNameWithInvitationEmailAddress;
  final String emailHash;
  final String? username;
  final String displayName;
  final String? attachedParticipatablePortraitUrl;
  final bool canCheckIn;
  final bool checkedIn;
  final bool reactivatable;
  final bool checkInOpen;
  final List<dynamic> groupPlayerIds;
  final bool hasIrrelevantSeed;

  DataData({
    required this.id,
    required this.tournamentId,
    required this.name,
    required this.seed,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.inviteEmail,
    required this.finalRank,
    required this.misc,
    required this.icon,
    required this.onWaitingList,
    required this.invitationId,
    required this.groupId,
    required this.checkedInAt,
    required this.rankedMemberId,
    required this.customFieldResponse,
    required this.clinch,
    required this.integrationUids,
    required this.challongeUsername,
    required this.challongeEmailAddressVerified,
    required this.removable,
    required this.participatableOrInvitationAttached,
    required this.confirmRemove,
    required this.invitationPending,
    required this.displayNameWithInvitationEmailAddress,
    required this.emailHash,
    required this.username,
    required this.displayName,
    required this.attachedParticipatablePortraitUrl,
    required this.canCheckIn,
    required this.checkedIn,
    required this.reactivatable,
    required this.checkInOpen,
    required this.groupPlayerIds,
    required this.hasIrrelevantSeed,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        tournamentId: json["tournament_id"],
        name: json["name"],
        seed: json["seed"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        inviteEmail: json["invite_email"],
        finalRank: json["final_rank"],
        misc: json["misc"],
        icon: json["icon"],
        onWaitingList: json["on_waiting_list"],
        invitationId: json["invitation_id"],
        groupId: json["group_id"],
        checkedInAt: DateTime.parse(json["checked_in_at"]),
        rankedMemberId: json["ranked_member_id"],
        customFieldResponse: json["custom_field_response"],
        clinch: json["clinch"],
        integrationUids: json["integration_uids"],
        challongeUsername: json["challonge_username"],
        challongeEmailAddressVerified: json["challonge_email_address_verified"],
        removable: json["removable"],
        participatableOrInvitationAttached:
            json["participatable_or_invitation_attached"],
        confirmRemove: json["confirm_remove"],
        invitationPending: json["invitation_pending"],
        displayNameWithInvitationEmailAddress:
            json["display_name_with_invitation_email_address"],
        emailHash: json["email_hash"],
        username: json["username"],
        displayName: json["display_name"],
        attachedParticipatablePortraitUrl:
            json["attached_participatable_portrait_url"],
        canCheckIn: json["can_check_in"],
        checkedIn: json["checked_in"],
        reactivatable: json["reactivatable"],
        checkInOpen: json["check_in_open"],
        groupPlayerIds:
            List<dynamic>.from(json["group_player_ids"].map((x) => x)),
        hasIrrelevantSeed: json["has_irrelevant_seed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tournament_id": tournamentId,
        "name": name,
        "seed": seed,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "invite_email": inviteEmail,
        "final_rank": finalRank,
        "misc": misc,
        "icon": icon,
        "on_waiting_list": onWaitingList,
        "invitation_id": invitationId,
        "group_id": groupId,
        "checked_in_at": checkedInAt.toIso8601String(),
        "ranked_member_id": rankedMemberId,
        "custom_field_response": customFieldResponse,
        "clinch": clinch,
        "integration_uids": integrationUids,
        "challonge_username": challongeUsername,
        "challonge_email_address_verified": challongeEmailAddressVerified,
        "removable": removable,
        "participatable_or_invitation_attached":
            participatableOrInvitationAttached,
        "confirm_remove": confirmRemove,
        "invitation_pending": invitationPending,
        "display_name_with_invitation_email_address":
            displayNameWithInvitationEmailAddress,
        "email_hash": emailHash,
        "username": username,
        "display_name": displayName,
        "attached_participatable_portrait_url":
            attachedParticipatablePortraitUrl,
        "can_check_in": canCheckIn,
        "checked_in": checkedIn,
        "reactivatable": reactivatable,
        "check_in_open": checkInOpen,
        "group_player_ids": List<dynamic>.from(groupPlayerIds.map((x) => x)),
        "has_irrelevant_seed": hasIrrelevantSeed,
      };
}
