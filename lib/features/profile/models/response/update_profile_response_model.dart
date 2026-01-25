class UpdateProfileResponseModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String role;
  final String avatar;
  final String avatarPublicId;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  UpdateProfileResponseModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
    required this.avatar,
    required this.avatarPublicId,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      avatar: json['avatar'],
      avatarPublicId: json['avatarPublicId'],
      refreshToken: json['refreshToken'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

}
