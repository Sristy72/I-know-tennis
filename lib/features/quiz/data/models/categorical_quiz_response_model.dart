class CategoricalQuizResponseModel {
  String? sId;
  QuizCategory? quizCategory;
  String? quizQuestion;
  List<String>? quizOptions;
  String? quizAnswer;
  int? quizPoint;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoricalQuizResponseModel(
      {this.sId,
        this.quizCategory,
        this.quizQuestion,
        this.quizOptions,
        this.quizAnswer,
        this.quizPoint,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CategoricalQuizResponseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quizCategory = json['quizCategory'] != null
        ? QuizCategory.fromJson(json['quizCategory'])
        : null;
    quizQuestion = json['quizQuestion'];

    quizOptions = (json['quizOptions'] as List?)
        ?.map((e) => e.toString())
        .toList()
        ?? [];

    quizAnswer = json['quizAnswer'];
    quizPoint = json['quizPoint'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

}

class QuizCategory {
  String? sId;
  String? quizCategoryName;

  QuizCategory({this.sId, this.quizCategoryName});

  QuizCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quizCategoryName = json['quizCategoryName'];
  }
}