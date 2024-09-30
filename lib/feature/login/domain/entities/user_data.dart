class User {
  final bool isAdmin;
  final String username;
  final String token;

  User({
    required this.isAdmin,
    required this.username,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isAdmin: json['isAdmin'],
      username: json['username'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAdmin'] = isAdmin;
    data['username'] = username;
    data['token'] = token;
    return data;
  }
}
