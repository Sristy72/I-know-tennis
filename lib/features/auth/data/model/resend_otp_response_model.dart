class ResendOtpResponseModel {
  final User user;
  final AuthTokens tokens;

  ResendOtpResponseModel({required this.user, required this.tokens});

  factory ResendOtpResponseModel.fromJson(List<dynamic> json) {
    return ResendOtpResponseModel(
      user: User.fromJson(json[0]),
      tokens: AuthTokens.fromJson(json[1]),
    );
  }
}

class User {
  final Subscription subscription;
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String role;
  final String createdAt;
  final String updatedAt;
  final String avatar;
  final String avatarPublicId;
  final String otp;
  final String otpExpire;

  User({
    required this.subscription,
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.avatar,
    required this.avatarPublicId,
    required this.otp,
    required this.otpExpire,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      subscription: Subscription.fromJson(json['subscription']),
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      avatar: json['avatar'],
      avatarPublicId: json['avatarPublicId'],
      otp: json['otp'],
      otpExpire: json['otpExpire'],
    );
  }
}

class Subscription {
  final bool isActive;

  Subscription({required this.isActive});

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(isActive: json['isActive']);
  }
}

class AuthTokens {
  final String accessToken;
  final String refreshToken;

  AuthTokens({required this.accessToken, required this.refreshToken});

  factory AuthTokens.fromJson(Map<String, dynamic> json) {
    return AuthTokens(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
