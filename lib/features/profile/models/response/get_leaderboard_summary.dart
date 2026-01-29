class GetLeaderboardSummary {
  final int quizzesPlayed;
  final int points;
  final int? yourPosition;
  final String message;
  final Performance performance;
  final CategoryProgress categoryProgress;

  GetLeaderboardSummary({
    required this.quizzesPlayed,
    required this.points,
    required this.yourPosition,
    required this.message,
    required this.performance,
    required this.categoryProgress,
  });

  factory GetLeaderboardSummary.fromJson(Map<String, dynamic> json) {
    return GetLeaderboardSummary(
      quizzesPlayed: json['quizzesPlayed'] ?? 0,
      points: json['points'] ?? 0,
      yourPosition: json['yourPosition'],
      message: json['message'] ?? '',
      performance: Performance.fromJson(json['performance'] ?? {}),
      categoryProgress:
      CategoryProgress.fromJson(json['categoryProgress'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizzesPlayed': quizzesPlayed,
      'points': points,
      'yourPosition': yourPosition,
      'message': message,
      'performance': performance.toJson(),
      'categoryProgress': categoryProgress.toJson(),
    };
  }
}

class Performance {
  final int accuracyPercent;

  Performance({required this.accuracyPercent});

  factory Performance.fromJson(Map<String, dynamic> json) {
    return Performance(
      accuracyPercent: json['accuracyPercent'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accuracyPercent': accuracyPercent,
    };
  }
}

class CategoryProgress {
  final int totalCategoriesAvailable;
  final int completedCategories;
  final int pendingCategories;
  final int completedPercent;
  final int pendingPercent;

  CategoryProgress({
    required this.totalCategoriesAvailable,
    required this.completedCategories,
    required this.pendingCategories,
    required this.completedPercent,
    required this.pendingPercent,
  });

  factory CategoryProgress.fromJson(Map<String, dynamic> json) {
    return CategoryProgress(
      totalCategoriesAvailable: json['totalCategoriesAvailable'] ?? 0,
      completedCategories: json['completedCategories'] ?? 0,
      pendingCategories: json['pendingCategories'] ?? 0,
      completedPercent: json['completedPercent'] ?? 0,
      pendingPercent: json['pendingPercent'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalCategoriesAvailable': totalCategoriesAvailable,
      'completedCategories': completedCategories,
      'pendingCategories': pendingCategories,
      'completedPercent': completedPercent,
      'pendingPercent': pendingPercent,
    };
  }
}
