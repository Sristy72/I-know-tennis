import 'package:flutter_iknow_tennis/core/network/api_client.dart';
import 'package:flutter_iknow_tennis/core/network/constants/api_constants.dart';
import 'package:flutter_iknow_tennis/core/network/network_result.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/categorical_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/jokes_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/quiz_summary_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/start_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/submit_quiz_request_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/view_result_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/quiz_repository.dart';

import '../models/submit_quiz_response_model.dart';

class QuizRepositoryImpl implements QuizRepository {
  final ApiClient _apiClient;

  QuizRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  NetworkResult<List<CategoricalQuizResponseModel>> getQuiz({
    required String categoryName,
  }) {
    return _apiClient.get(
      ApiConstants.quiz.getQuiz,
      queryParameters: {'categoryName': categoryName},
      fromJsonT: (json) {
        List list;

        if (json is Map<String, dynamic>) {
          list = json['data'] as List? ?? [];
        } else if (json is List) {
          list = json;
        } else {
          list = [];
        }

        return list
            .map(
              (e) => CategoricalQuizResponseModel.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList();
      },
    );
  }

  @override
  NetworkResult<SubmitQuizResponseModel> submitQuiz(
    SubmitQuizRequestModel requestModel,
  ) {
    return _apiClient.post(
      ApiConstants.playQuiz.submitQuiz,
      data: requestModel.toJson(),
      fromJsonT: (json) => SubmitQuizResponseModel.fromJson(json),
    );
  }

  @override
  NetworkResult<StartQuizResponseModel> startQuiz({
    required String categoryId,
  }) {
    
    return _apiClient.get(
      ApiConstants.playQuiz.startQuiz(categoryId),

      fromJsonT: (json) => StartQuizResponseModel.fromJson(json),
    );
  }

  @override
  NetworkResult<QuizSummaryResponseModel> quizSummary({
    required String attemptId,
  }) {
    return _apiClient.get(
      ApiConstants.quizStatus.attemptQuizSummary(attemptId),
      fromJsonT: (json) => QuizSummaryResponseModel.fromJson(json),
    );
  }

  @override
  NetworkResult<ViewResultResponseModel> viewResult({
    required String attemptId,
  }) {
    return _apiClient.get(
      ApiConstants.playQuiz.viewResult(attemptId),
      fromJsonT: (json) => ViewResultResponseModel.fromJson(json),
    );
  }

  @override
  NetworkResult<JokesResponseModel> jokes() {
    return _apiClient.get(
      ApiConstants.playQuiz.jokes,
      fromJsonT: (json) => JokesResponseModel.fromJson(json),
    );
  }
}
