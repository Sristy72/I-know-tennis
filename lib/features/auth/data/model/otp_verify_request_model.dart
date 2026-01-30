class OtpVerifyRequestModel {
  final String email;
  final String otp;

  OtpVerifyRequestModel({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otp,
    };
  }
}
