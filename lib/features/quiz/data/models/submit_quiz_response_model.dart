class SubmitQuizResponseModel {
  String? attemptId;
  int? totalScore;
  int? correctAnswers;

  SubmitQuizResponseModel(
      {this.attemptId, this.totalScore, this.correctAnswers});

  SubmitQuizResponseModel.fromJson(Map<String, dynamic> json) {
    attemptId = json['attemptId'];
    totalScore = json['totalScore'];
    correctAnswers = json['correctAnswers'];
  }
}