
class ResendOtpRequestModel {
  final String email;

  ResendOtpRequestModel({required this.email});

  // Convert from JSON → Model
  factory ResendOtpRequestModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpRequestModel(
      email: json['email'] ?? '',
    );
  }

  // Convert from Model → JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
