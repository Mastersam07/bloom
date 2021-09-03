class UserModel {
  final String username;
  final String fullName;
  final String email;
  final String phoneNumber;

  UserModel({this.username, this.fullName, this.email, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username?.trim(),
      'fullName': fullName?.trim(),
      'email': email?.trim(),
      'phoneNumber': phoneNumber?.trim(),
    }..removeWhere((key, value) => value == null);
  }
}
