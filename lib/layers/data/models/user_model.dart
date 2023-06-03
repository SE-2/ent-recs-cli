class UserModel {
  final String token;
  final String email;
  final String name;
  final String photoUrl;

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
    return UserModel(
        token: token, email: email, name: name, photoUrl: photoUrl);
  }

  UserModel({
    this.token = "",
    this.email = "",
    this.name = "Mohammad",
    this.photoUrl = "https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg",
  });
}
