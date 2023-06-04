class UserAbstractInfo {
  final String name;
  final String? profileImgUrl;

  UserAbstractInfo({ required this.name, this.profileImgUrl});

  factory UserAbstractInfo.fromJson(Map<String, dynamic> json) {
    return UserAbstractInfo(
      name: json['name'],
      profileImgUrl: json['profileImgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profileImgUrl': profileImgUrl,
    };
  }
}