class UserModel {
  final String username;
  final String fullName;
  final String email;

  UserModel({this.username, this.fullName, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username?.trim(),
      'fullName': fullName?.trim(),
      'email': email?.trim(),
    }..removeWhere((key, value) => value == null);
  }
}
