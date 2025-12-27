// class LoginResponseModel {
//   final String id;
//   final String fullName;
//   final String email;
//   final String? avatar;
//   final String role;

//   LoginResponseModel({
//     required this.id,
//     required this.fullName,
//     required this.email,
//     this.avatar,
//     required this.role,
//   });

//   factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//       id: json['_id'] ?? '',
//       fullName: json['fullName'] ?? '',
//       email: json['email'] ?? '',
//       avatar: json['avatar'],
//       role: json['role'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'fullName': fullName,
//       'email': email,
//       'avatar': avatar,
//       'role': role,
//     };
//   }
// }

class LoginResponseModel {
  final String id;
  final String fullName;
  final String email;
  final String? avatar;
  final String role;
  final Token token;

  LoginResponseModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatar,
    required this.role,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      role: json['role'] as String,
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
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
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}

