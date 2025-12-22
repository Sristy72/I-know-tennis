class GetAllSubscriptionResponseModel {
  final String id;
  final String subscriptionPlanName;
  final int subscriptionMonthlyPlanPrice;
  final int subscriptionYearlyPlanPrice;
  final List<String> subscriptionDetailsList;
  final DateTime createdAt;
  final DateTime updatedAt;

  GetAllSubscriptionResponseModel({
    required this.id,
    required this.subscriptionPlanName,
    required this.subscriptionMonthlyPlanPrice,
    required this.subscriptionYearlyPlanPrice,
    required this.subscriptionDetailsList,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetAllSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllSubscriptionResponseModel(
      id: json['_id'],
      subscriptionPlanName: json['subscriptionPlanName'],
      subscriptionMonthlyPlanPrice: json['subscriptionMonthlyPlanPrice'],
      subscriptionYearlyPlanPrice: json['subscriptionYearlyPlanPrice'],
      subscriptionDetailsList:
      List<String>.from(json['subscriptionDetailsList']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
