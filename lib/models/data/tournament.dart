class Tournament {
  final List<Game> games;
  final List<Prize> prizes;
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
  final dynamic rules;
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

  Tournament({
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
    required this.isExclusive,
    required this.startedAt,
    required this.endedAt,
    required this.publishedAt,
    required this.slug,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
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

class Game {
  final String name;
  final dynamic thumbnail;
  final String image;
  final String? description;
  final int? rating;
  final bool isActive;
  final String slug;

  Game({
    required this.name,
    required this.thumbnail,
    required this.image,
    required this.description,
    required this.rating,
    required this.isActive,
    required this.slug,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        name: json["name"],
        thumbnail: json["thumbnail"],
        image: json["image"],
        description: json["description"],
        rating: json["rating"],
        isActive: json["is_active"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "thumbnail": thumbnail,
        "image": image,
        "description": description,
        "rating": rating,
        "is_active": isActive,
        "slug": slug,
      };
}

class Prize {
  final int id;
  final int rank;
  final String prizeType;
  final int value;

  Prize({
    required this.id,
    required this.rank,
    required this.prizeType,
    required this.value,
  });

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
        id: json["id"],
        rank: json["rank"],
        prizeType: json["prize_type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "prize_type": prizeType,
        "value": value,
      };
}
