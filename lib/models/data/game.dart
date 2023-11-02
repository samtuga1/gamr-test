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
