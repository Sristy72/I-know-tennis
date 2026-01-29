class SubmitQuizRequestModel {
  String? categoryId;
  List<Answers>? answers;

  SubmitQuizRequestModel({this.categoryId, this.answers});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String? questionId;
  String? selectedOption;

  Answers({this.questionId, this.selectedOption});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionId'] = questionId;
    data['selectedOption'] = selectedOption;
    return data;
  }
}