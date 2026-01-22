class ResetChangePasswordRequestModel {
  final String email;
  final String password;
  final String confirmPassword;

  ResetChangePasswordRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory ResetChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ResetChangePasswordRequestModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
    );
  }
}
