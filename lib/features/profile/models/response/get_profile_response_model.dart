class GetProfileResponseModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String role;
  final String createdAt;
  final String updatedAt;
  final int version;
  final String avatar;
  final String avatarPublicId;

  GetProfileResponseModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.avatar,
    required this.avatarPublicId,
  });

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return GetProfileResponseModel(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
      avatar: json['avatar'],
      avatarPublicId: json['avatarPublicId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'role': role,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
      'avatar': avatar,
      'avatarPublicId': avatarPublicId,
    };
  }
}
