class LoginResponseModel {
  final String id;
  final String fullName;
  final String email;
  final String? avatar;
  final String role;

  LoginResponseModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatar,
    required this.role,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'],
      role: json['role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'avatar': avatar,
      'role': role,
    };
  }
}
