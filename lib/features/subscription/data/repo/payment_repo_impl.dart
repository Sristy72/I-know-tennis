import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';

import '../../domain/repo/payment_repo.dart';
import '../model/payment_request_model.dart';
import '../model/payment_response_model.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final ApiClient _apiClient;

  PaymentRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  NetworkResult<PaymentResponseModel> createPayment(
    PaymentRequestModel request,
  ) {
    return _apiClient.post(
       ApiConstants.payment.createPayment,
      data: request.toJson(),
      fromJsonT: (json) {
        if (json == null) {
          throw Exception("API returned null for payment creation");
        }

        if (json is Map<String, dynamic>) {
          // Check if response has nested data field
          if (json.containsKey('data') && json['data'] != null) {
            return PaymentResponseModel.fromJson(
              json['data'] as Map<String, dynamic>,
            );
          }
          // Direct response format
          return PaymentResponseModel.fromJson(json);
        }

        throw Exception("Unexpected payment API response format");
      },
    );
  }
}
