class ForgetPassResponseModel {
  final bool status;
  final int statusCode;
  final String message;
  final dynamic data; // nullable

  ForgetPassResponseModel({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory ForgetPassResponseModel.fromJson(dynamic json) {
    // Handle the case where ApiClient passes null as fallback
    if (json == null) {
      return ForgetPassResponseModel(
        status: false,
        statusCode: 0,
        message: 'No data',
        data: null,
      );
    }

    // Safe casting with defaults
    if (json is! Map<String, dynamic>) {
      return ForgetPassResponseModel(
        status: false,
        statusCode: 0,
        message: 'Invalid response format',
        data: null,
      );
    }

    return ForgetPassResponseModel(
      status: json['status'] as bool? ?? false,
      statusCode: json['statusCode'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'], // can be null, no casting needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }
}