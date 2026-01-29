
class QuizCategoryResponse {
  final String? id;
  final String? quizCategoryName;
  final int? quizCount;
  final String? quizCategoryImage;
  final String? quizCategoryImageId;
  final String? quizCategoryState;
  final int? quizPoint;
  final String? quizCategoryDetails;
  final int? quizTotalTime;
  final List<String>? quizzes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;

  QuizCategoryResponse({
    this.id,
    this.quizCategoryName,
    this.quizCount,
    this.quizCategoryImage,
    this.quizCategoryImageId,
    this.quizCategoryState,
    this.quizPoint,
    this.quizCategoryDetails,
    this.quizTotalTime,
    this.quizzes,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory QuizCategoryResponse.fromJson(Map<String, dynamic> json) {
    return QuizCategoryResponse(
      id: json['_id'],
      quizCategoryName: json['quizCategoryName'],
      quizCount: json['quizCount'],
      quizCategoryImage: json['quizCategoryImage'],
      quizCategoryImageId: json['quizCategoryImageId'],
      quizCategoryState: json['quizCategoryState'],
      quizPoint: json['quizPoint'],
      quizCategoryDetails: json['quizCategoryDetails'],
      quizTotalTime: json['quizTotalTime'],
      quizzes: json['quizzes'] != null
          ? List<String>.from(json['quizzes'])
          : [],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'quizCategoryName': quizCategoryName,
      'quizCount': quizCount,
      'quizCategoryImage': quizCategoryImage,
      'quizCategoryImageId': quizCategoryImageId,
      'quizCategoryState': quizCategoryState,
      'quizPoint': quizPoint,
      'quizCategoryDetails': quizCategoryDetails,
      'quizTotalTime': quizTotalTime,
      'quizzes': quizzes,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': version,
    };
  }

  /// 🔹 Helper to parse list of quiz categories
  static List<QuizCategoryResponse> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => QuizCategoryResponse.fromJson(json))
        .toList();
  }
}
