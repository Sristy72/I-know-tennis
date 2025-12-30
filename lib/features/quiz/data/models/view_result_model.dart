class ViewResultResponseModel {
  String? sId;
  String? user;
  String? category;
  List<Answers>? answers;
  int? totalScore;
  int? correctAnswers;
  int? totalQuestions;
  int? timeTakenSeconds;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ViewResultResponseModel(
      {this.sId,
        this.user,
        this.category,
        this.answers,
        this.totalScore,
        this.correctAnswers,
        this.totalQuestions,
        this.timeTakenSeconds,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ViewResultResponseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    category = json['category'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
    totalScore = json['totalScore'];
    correctAnswers = json['correctAnswers'];
    totalQuestions = json['totalQuestions'];
    timeTakenSeconds = json['timeTakenSeconds'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

}

class Answers {
  Question? question;
  String? selectedOption;
  String? correctOption;
  bool? isCorrect;
  int? point;
  String? sId;

  Answers(
      {this.question,
        this.selectedOption,
        this.correctOption,
        this.isCorrect,
        this.point,
        this.sId});

  Answers.fromJson(Map<String, dynamic> json) {
    question = json['question'] != null
        ? Question.fromJson(json['question'])
        : null;
    selectedOption = json['selectedOption'];
    correctOption = json['correctOption'];
    isCorrect = json['isCorrect'];
    point = json['point'];
    sId = json['_id'];
  }

}

class Question {
  String? sId;
  String? quizQuestion;
  List<String>? quizOptions;

  Question({this.sId, this.quizQuestion, this.quizOptions});

  Question.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quizQuestion = json['quizQuestion'];
    quizOptions = json['quizOptions'].cast<String>();
  }

}