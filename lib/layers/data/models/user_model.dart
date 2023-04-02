class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});

  static UserModel fromJson(Map<String, dynamic> json) {
    final email = json['email'];
    final password = json['password'];
    return UserModel(email: email, password: password);
  }
}
