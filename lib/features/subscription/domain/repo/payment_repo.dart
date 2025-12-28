

import '../../../../core/network/network_result.dart';
import '../../data/model/payment_request_model.dart';
import '../../data/model/payment_response_model.dart';

/// Payment repository interface (domain layer)
abstract class PaymentRepository {
  /// Create payment intent for subscription
  NetworkResult<PaymentResponseModel> createPayment(PaymentRequestModel request);
  
  /// Confirm payment completion
  // NetworkResult<void> confirmPayment(PaymentConfirmRequestModel request);
}