class LoginResponse {
  final String status;
  final String message;
  final Data data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final User user;
  final String token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  final String name;
  final String role;
  final String username;
  final String email;
  final dynamic avatar;
  final String joined;

  User({
    required this.name,
    required this.role,
    required this.username,
    required this.email,
    required this.avatar,
    required this.joined,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        role: json["role"],
        username: json["username"],
        email: json["email"],
        avatar: json["avatar"],
        joined: json["joined"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "username": username,
        "email": email,
        "avatar": avatar,
        "joined": joined,
      };
}
