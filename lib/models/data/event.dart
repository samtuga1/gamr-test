class Event {
  final int id;
  final String name;
  final String banner;
  final String description;
  final String location;
  final String lat;
  final String lng;
  final dynamic rules;
  final bool isPublic;
  final bool isExclusive;
  final bool isApproved;
  final DateTime startedAt;
  final DateTime endedAt;
  final DateTime publishedAt;
  final bool isOrganizer;
  final String slug;

  Event({
    required this.id,
    required this.name,
    required this.banner,
    required this.description,
    required this.location,
    required this.lat,
    required this.lng,
    required this.rules,
    required this.isPublic,
    required this.isExclusive,
    required this.isApproved,
    required this.startedAt,
    required this.endedAt,
    required this.publishedAt,
    required this.isOrganizer,
    required this.slug,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        banner: json["banner"],
        description: json["description"],
        location: json["location"],
        lat: json["lat"],
        lng: json["lng"],
        rules: json["rules"],
        isPublic: json["is_public"],
        isExclusive: json["is_exclusive"],
        isApproved: json["is_approved"],
        startedAt: DateTime.parse(json["started_at"]),
        endedAt: DateTime.parse(json["ended_at"]),
        publishedAt: DateTime.parse(json["published_at"]),
        isOrganizer: json["is_organizer"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "banner": banner,
        "description": description,
        "location": location,
        "lat": lat,
        "lng": lng,
        "rules": rules,
        "is_public": isPublic,
        "is_exclusive": isExclusive,
        "is_approved": isApproved,
        "started_at": startedAt.toIso8601String(),
        "ended_at": endedAt.toIso8601String(),
        "published_at": publishedAt.toIso8601String(),
        "is_organizer": isOrganizer,
        "slug": slug,
      };
}
