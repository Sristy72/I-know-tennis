import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/network_result.dart';
import '../../domain/home_repo.dart';
import '../model/quiz_category_response_model.dart';
import '../model/quiz_response_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiClient _apiClient;

  HomeRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  // @override
  // NetworkResult<QuizResponseModel> getAllQuiz() {
  //   return _apiClient.get<QuizResponseModel>(
  //     ApiConstants.home.getQuiz,
  //     fromJsonT: (json) => QuizResponseModel.fromJson(json),
  //   );
  // }

  @override
  NetworkResult<List<QuizResponseModel>> getAllQuiz() {
    return _apiClient.get(
      ApiConstants.home.getQuiz,
      fromJsonT: (json) => (json as List)
          .map((item) => QuizResponseModel.fromJson(item))
          .toList(),
    );
  }

  // @override
  // NetworkResult<List<QuizCategoryResponse>> getAllQuizCat() {
  //   return _apiClient.get(
  //     ApiConstants.home.getCategories,
  //     fromJsonT: (json) => (json as List)
  //         .map((item) => QuizCategoryResponse.fromJson(item))
  //         .toList(),
  //   );
  // }

@override
NetworkResult<List<QuizCategoryResponse>> getAllQuizCat() {
  return _apiClient.get(
    ApiConstants.home.getCategories,
    fromJsonT: (json) {
      // Ensure json is a List
      if (json is! List) {
        // You can log or handle unexpected format
        return <QuizCategoryResponse>[];
      }

      return json
          .whereType<Map<String, dynamic>>() // This filters nulls AND ensures it's a Map
          .map((item) => QuizCategoryResponse.fromJson(item))
          .toList();
    },
  );
}


  }
