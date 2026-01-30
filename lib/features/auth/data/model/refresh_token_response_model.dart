class RefreshTokenResponseModel {
  final String id;
  final String fullName;
  final String email;
  final String? avatar;
  final String role;
  final Token token;

  RefreshTokenResponseModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatar,
    required this.role,
    required this.token,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponseModel(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      avatar: json['avatar'],
      role: json['role'],
      token: Token.fromJson(json['token']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'avatar': avatar,
      'role': role,
      'token': token.toJson(),
    };
  }
}
class Token {
  final String accessToken;
  final String refreshToken;

  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}

