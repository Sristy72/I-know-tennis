class PaymentRequestModel {
  final String planId;
  final String billingType; // "monthly" or "yearly"

  PaymentRequestModel({
    required this.planId,
    required this.billingType,
  });

  /// Convert model to JSON for API request
  Map<String, dynamic> toJson() {
    return {
      'planId': planId,
      'billingType': billingType,
    };
  }
}
