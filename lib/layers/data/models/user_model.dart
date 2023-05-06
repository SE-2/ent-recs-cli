class UserModel {
  final String token;
  final String email;
  final String name;
  final String? photoUrl;

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'email': email,
      'name': name,
      'photo_url': photoUrl,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    final token = json['token'];
    final email = json['email'];
    final name = json['name'];
    final photoUrl = json['photo_url'];
    return
      UserModel(token: token, email: email, name: name, photoUrl: photoUrl);
  }

  UserModel({
    required this.token,
    required this.email,
    required this.name,
    this.photoUrl,
  });
}
