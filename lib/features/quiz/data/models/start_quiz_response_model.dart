class StartQuizResponseModel {
  Category? category;
  List<Questions>? questions;

  StartQuizResponseModel({this.category, this.questions});

  StartQuizResponseModel.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }
}

class Category {
  String? id;
  String? name;
  int? totalTime;
  int? totalQuestions;

  Category({this.id, this.name, this.totalTime, this.totalQuestions});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalTime = json['totalTime'];
    totalQuestions = json['totalQuestions'];
  }

}

class Questions {
  String? sId;
  String? quizCategory;
  String? quizQuestion;
  List<String>? quizOptions;
  int? quizPoint;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Questions(
      {this.sId,
        this.quizCategory,
        this.quizQuestion,
        this.quizOptions,
        this.quizPoint,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Questions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quizCategory = json['quizCategory'];
    quizQuestion = json['quizQuestion'];
    quizOptions = json['quizOptions'].cast<String>();
    quizPoint = json['quizPoint'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}