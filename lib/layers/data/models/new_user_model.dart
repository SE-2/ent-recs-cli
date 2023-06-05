class NewUserModel {
  final String email;
  final String? birthDate;
  final String token;
  final String name;
  final String? profileImgUrl;

  NewUserModel({required this.token, required this.name, required this.email, this.birthDate, this.profileImgUrl});

  factory NewUserModel.fromJson(Map<String, dynamic> json) {
    return NewUserModel(
      email: json['email'],
      birthDate: json['birthDate'],
      token: json['token'],
      name: json['name'],
      profileImgUrl: json['profileImgUrl'],
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'email': email,
      'birthDate': birthDate,
      'token': token,
      'name': name,
      'profileImgUrl': profileImgUrl,
    };
  }
}