

// class QuizResponseModel {
//   final bool? status;
//   final int? statusCode;
//   final String? message;
//   final List<QuizData>? data;

//   QuizResponseModel({
//     this.status,
//     this.statusCode,
//     this.message,
//     this.data,
//   });

//   factory QuizResponseModel.fromJson(Map<String, dynamic> json) {
//     final dataList = json['data'];
//     List<QuizData>? quizzes;
//     if (dataList != null && dataList is List) {
//       quizzes = dataList
//           .where((item) => item is Map<String, dynamic>)
//           .cast<Map<String, dynamic>>()
//           .map((item) => QuizData.fromJson(item))
//           .toList();
//     }

//     return QuizResponseModel(
//       status: json['status'] as bool?,
//       statusCode: json['statusCode'] as int?,
//       message: json['message'] as String?,
//       data: quizzes,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'statusCode': statusCode,
//       'message': message,
//       'data': data?.map((item) => item.toJson()).toList(),
//     };
//   }
// }

// class QuizData {
//   final String? id;
//   final QuizCategory? quizCategory;
//   final String? quizQuestion;
//   final List<String>? quizOptions;
//   final String? quizAnswer;
//   final int? quizPoint;
//   final bool? isActive;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   QuizData({
//     this.id,
//     this.quizCategory,
//     this.quizQuestion,
//     this.quizOptions,
//     this.quizAnswer,
//     this.quizPoint,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });

//  factory QuizData.fromJson(Map<String, dynamic> json) {
//   final categoryJson = json['quizCategory'];
//   return QuizData(
//     id: json['_id'] as String?,
//     quizCategory: categoryJson is Map<String, dynamic>
//         ? QuizCategory.fromJson(categoryJson)
//         : null,
//     quizQuestion: json['quizQuestion'] as String?,
//     quizOptions: json['quizOptions'] is List
//         ? List<String>.from(json['quizOptions'] as List)
//         : null,
//     quizAnswer: json['quizAnswer'] as String?,
//     quizPoint: json['quizPoint'] as int?,
//     isActive: json['isActive'] as bool?,
//     createdAt: json['createdAt'] is String
//         ? DateTime.tryParse(json['createdAt'] as String)
//         : null,
//     updatedAt: json['updatedAt'] is String
//         ? DateTime.tryParse(json['updatedAt'] as String)
//         : null,
//   );
// }
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'quizCategory': quizCategory?.toJson(),
//       'quizQuestion': quizQuestion,
//       'quizOptions': quizOptions,
//       'quizAnswer': quizAnswer,
//       'quizPoint': quizPoint,
//       'isActive': isActive,
//       'createdAt': createdAt?.toIso8601String(),
//       'updatedAt': updatedAt?.toIso8601String(),
//     };
//   }
// }

// class QuizCategory {
//   final String? id;
//   final String? quizCategoryName;

//   QuizCategory({this.id, this.quizCategoryName});

//   factory QuizCategory.fromJson(Map<String, dynamic> json) {
//     return QuizCategory(
//       id: json['_id'] as String?,
//       quizCategoryName: json['quizCategoryName'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'quizCategoryName': quizCategoryName,
//     };
//   }
// }


// quiz_response_model.dart

// class QuizResponseModel {
//   final List<QuizData>? data;
//   final Pagination? pagination;

//   QuizResponseModel({this.data, this.pagination});

//   factory QuizResponseModel.fromJson(Map<String, dynamic> json) {
//     return QuizResponseModel(
//       data: json['data'] != null
//           ? List<QuizData>.from(
//               (json['data'] as List).map((x) => QuizData.fromJson(x)))
//           : null,
//       pagination: json['pagination'] != null
//           ? Pagination.fromJson(json['pagination'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'data': data?.map((x) => x.toJson()).toList(),
//         'pagination': pagination?.toJson(),
//       };
// }

// class QuizData {
//   final String? id;
//   final QuizCategory? quizCategory;
//   final String? quizQuestion;
//   final List<String>? quizOptions;
//   final String? quizAnswer;
//   final int? quizPoint;
//   final bool? isActive;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   QuizData({
//     this.id,
//     this.quizCategory,
//     this.quizQuestion,
//     this.quizOptions,
//     this.quizAnswer,
//     this.quizPoint,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory QuizData.fromJson(Map<String, dynamic> json) => QuizData(
//         id: json['_id'],
//         quizCategory: json['quizCategory'] != null
//             ? QuizCategory.fromJson(json['quizCategory'])
//             : null,
//         quizQuestion: json['quizQuestion'],
//         quizOptions: json['quizOptions'] != null
//             ? List<String>.from(json['quizOptions'])
//             : null,
//         quizAnswer: json['quizAnswer'],
//         quizPoint: json['quizPoint'],
//         isActive: json['isActive'],
//         createdAt: json['createdAt'] != null
//             ? DateTime.parse(json['createdAt'])
//             : null,
//         updatedAt: json['updatedAt'] != null
//             ? DateTime.parse(json['updatedAt'])
//             : null,
//       );

//   Map<String, dynamic> toJson() => {
//         '_id': id,
//         'quizCategory': quizCategory?.toJson(),
//         'quizQuestion': quizQuestion,
//         'quizOptions': quizOptions,
//         'quizAnswer': quizAnswer,
//         'quizPoint': quizPoint,
//         'isActive': isActive,
//         'createdAt': createdAt?.toIso8601String(),
//         'updatedAt': updatedAt?.toIso8601String(),
//       };
// }

// class QuizCategory {
//   final String? id;
//   final String? quizCategoryName;

//   QuizCategory({this.id, this.quizCategoryName});

//   factory QuizCategory.fromJson(Map<String, dynamic> json) => QuizCategory(
//         id: json['_id'],
//         quizCategoryName: json['quizCategoryName'],
//       );

//   Map<String, dynamic> toJson() => {
//         '_id': id,
//         'quizCategoryName': quizCategoryName,
//       };
// }

// class Pagination {
//   final int? total;
//   final int? page;
//   final int? limit;
//   final int? totalPages;

//   Pagination({this.total, this.page, this.limit, this.totalPages});

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         total: json['total'],
//         page: json['page'],
//         limit: json['limit'],
//         totalPages: json['totalPages'],
//       );

//   Map<String, dynamic> toJson() => {
//         'total': total,
//         'page': page,
//         'limit': limit,
//         'totalPages': totalPages,
//       };
// }

// quiz_response_model.dart

class QuizResponseModel {
  final String id;
  final QuizCategory quizCategory;
  final String quizQuestion;
  final List<String> quizOptions;
  final String quizAnswer;
  final int quizPoint;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  QuizResponseModel({
    required this.id,
    required this.quizCategory,
    required this.quizQuestion,
    required this.quizOptions,
    required this.quizAnswer,
    required this.quizPoint,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory QuizResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizResponseModel(
      id: json['_id'] as String,
      quizCategory: QuizCategory.fromJson(json['quizCategory']),
      quizQuestion: json['quizQuestion'] as String,
      quizOptions: List<String>.from(json['quizOptions'] ?? []),
      quizAnswer: json['quizAnswer'] as String,
      quizPoint: json['quizPoint'] as int,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'quizCategory': quizCategory.toJson(),
      'quizQuestion': quizQuestion,
      'quizOptions': quizOptions,
      'quizAnswer': quizAnswer,
      'quizPoint': quizPoint,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class QuizCategory {
  final String id;
  final String quizCategoryName;

  QuizCategory({
    required this.id,
    required this.quizCategoryName,
  });

  factory QuizCategory.fromJson(Map<String, dynamic> json) {
    return QuizCategory(
      id: json['_id'] as String,
      quizCategoryName: json['quizCategoryName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'quizCategoryName': quizCategoryName,
    };
  }
}
