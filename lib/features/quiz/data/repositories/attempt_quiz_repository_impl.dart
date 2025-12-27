import 'package:flutter_iknow_tennis/core/network/api_client.dart';
import 'package:flutter_iknow_tennis/core/network/constants/api_constants.dart';
import 'package:flutter_iknow_tennis/core/network/network_result.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/categorical_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/attempt_quiz_repository.dart';

class AttemptQuizRepositoryImpl implements AttemptQuizRepository {
  final ApiClient _apiClient;

  AttemptQuizRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  NetworkResult<List<CategoricalQuizResponseModel>> getQuiz() {
    return _apiClient.get(
      ApiConstants.quiz.getQuiz,
      queryParameters: {'categoryName': 'Service'},
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
}
