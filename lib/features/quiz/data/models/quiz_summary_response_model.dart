class QuizSummaryResponseModel {
  String? attemptId;
  Category? category;
  int? totalQuestions;
  int? correctAnswers;
  int? incorrectAnswers;
  int? totalScore;
  int? accuracyPercent;

  QuizSummaryResponseModel(
      {this.attemptId,
        this.category,
        this.totalQuestions,
        this.correctAnswers,
        this.incorrectAnswers,
        this.totalScore,
        this.accuracyPercent,
        });

  QuizSummaryResponseModel.fromJson(Map<String, dynamic> json) {
    attemptId = json['attemptId'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    totalQuestions = json['totalQuestions'];
    correctAnswers = json['correctAnswers'];
    incorrectAnswers = json['incorrectAnswers'];
    totalScore = json['totalScore'];
    accuracyPercent = json['accuracyPercent'];
  }
}

class Category {
  String? sId;
  String? quizCategoryName;
  String? quizCategoryImage;
  int? quizTotalTime;

  Category(
      {this.sId,
        this.quizCategoryName,
        this.quizCategoryImage,
        this.quizTotalTime});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quizCategoryName = json['quizCategoryName'];
    quizCategoryImage = json['quizCategoryImage'];
    quizTotalTime = json['quizTotalTime'];
  }
}