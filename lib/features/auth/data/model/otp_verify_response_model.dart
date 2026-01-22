class OtpVerifyResponseModel {
  final bool? status;
  final int? statusCode;
  final String? message;
  final dynamic data;

  OtpVerifyResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory OtpVerifyResponseModel.fromJson(dynamic json) {
    if (json == null || json is! Map<String, dynamic>) {
      // Return a safe default when ApiClient passes null
      return OtpVerifyResponseModel(
        status: false,
        statusCode: 0,
        message: 'No response data',
        data: null,
      );
    }

    return OtpVerifyResponseModel(
      status: json['status'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: json['data'],
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