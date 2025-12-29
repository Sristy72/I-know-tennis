class PaymentResponseModel {
  final CheckoutData data;

  PaymentResponseModel({
    required this.data,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      data: CheckoutData.fromJson(json['data']),
    );
  }
}

class CheckoutData {
  final String checkoutUrl;

  CheckoutData({
    required this.checkoutUrl,
  });

  factory CheckoutData.fromJson(Map<String, dynamic> json) {
    return CheckoutData(
      checkoutUrl: json['checkoutUrl'] as String,
    );
  }
}
