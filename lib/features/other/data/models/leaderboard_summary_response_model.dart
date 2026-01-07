class LeaderboardSummaryResponseModel {
  int? quizzesPlayed;
  int? points;
  int? yourPosition;
  String? message;
  Performance? performance;
  CategoryProgress? categoryProgress;

  LeaderboardSummaryResponseModel(
      {this.quizzesPlayed,
        this.points,
        this.yourPosition,
        this.message,
        this.performance,
        this.categoryProgress});

  LeaderboardSummaryResponseModel.fromJson(Map<String, dynamic> json) {
    quizzesPlayed = json['quizzesPlayed'];
    points = json['points'];
    yourPosition = json['yourPosition'];
    message = json['message'];
    performance = json['performance'] != null
        ? Performance.fromJson(json['performance'])
        : null;
    categoryProgress = json['categoryProgress'] != null
        ? CategoryProgress.fromJson(json['categoryProgress'])
        : null;
  }
}

class Performance {
  int? accuracyPercent;

  Performance({this.accuracyPercent});

  Performance.fromJson(Map<String, dynamic> json) {
    accuracyPercent = json['accuracyPercent'];
  }
}

class CategoryProgress {
  int? totalCategoriesAvailable;
  int? completedCategories;
  int? pendingCategories;
  int? completedPercent;
  int? pendingPercent;

  CategoryProgress(
      {this.totalCategoriesAvailable,
        this.completedCategories,
        this.pendingCategories,
        this.completedPercent,
        this.pendingPercent});

  CategoryProgress.fromJson(Map<String, dynamic> json) {
    totalCategoriesAvailable = json['totalCategoriesAvailable'];
    completedCategories = json['completedCategories'];
    pendingCategories = json['pendingCategories'];
    completedPercent = json['completedPercent'];
    pendingPercent = json['pendingPercent'];
  }
}