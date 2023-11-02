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
