import 'package:flutter_iknow_tennis/core/network/network_result.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/categorical_quiz_response_model.dart';

abstract class AttemptQuizRepository{
  NetworkResult<List<CategoricalQuizResponseModel>> getQuiz();
}