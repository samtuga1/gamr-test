class UserData {
  final String status;
  final Data data;

  UserData({
    required this.status,
    required this.data,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  final String name;
  final String role;
  final String username;
  final String displayName;
  final String email;
  final String avatar;
  final String timezone;
  final dynamic isFollowing;
  final String joined;
  final int joinedAt;

  Data({
    required this.name,
    required this.role,
    required this.username,
    required this.displayName,
    required this.email,
    required this.avatar,
    required this.timezone,
    required this.isFollowing,
    required this.joined,
    required this.joinedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        role: json["role"],
        username: json["username"],
        displayName: json["display_name"],
        email: json["email"],
        avatar: json["avatar"],
        timezone: json["timezone"],
        isFollowing: json["is_following"],
        joined: json["joined"],
        joinedAt: json["joined_at"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "username": username,
        "display_name": displayName,
        "email": email,
        "avatar": avatar,
        "timezone": timezone,
        "is_following": isFollowing,
        "joined": joined,
        "joined_at": joinedAt,
      };
}
