
class ForgetPassRequestModel {
  final String email;

  ForgetPassRequestModel({required this.email});

  // Convert from JSON → Model
  factory ForgetPassRequestModel.fromJson(Map<String, dynamic> json) {
    return ForgetPassRequestModel(
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
