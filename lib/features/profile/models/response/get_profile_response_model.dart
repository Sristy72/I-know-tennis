class GetProfileResponseModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final String avatar;
  final String avatarPublicId;
  final Subscription subscription;

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
    required this.subscription,
  });

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return GetProfileResponseModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'] ?? 0,
      avatar: json['avatar'] ?? '',
      avatarPublicId: json['avatarPublicId'] ?? '',
      subscription: Subscription.fromJson(json['subscription'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
      'avatar': avatar,
      'avatarPublicId': avatarPublicId,
      'subscription': subscription.toJson(),
    };
  }
}

class Subscription {
  final bool isActive;

  Subscription({required this.isActive});

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      isActive: json['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isActive': isActive,
    };
  }
}
