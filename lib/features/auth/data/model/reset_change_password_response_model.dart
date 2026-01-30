class ResetChangePasswordResponseModel {
  final bool status;
  final String message;

  ResetChangePasswordResponseModel({
    required this.status,
    required this.message,
  });

  factory ResetChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetChangePasswordResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
