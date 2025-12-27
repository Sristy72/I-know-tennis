import 'package:flutter_iknow_tennis/core/network/network_result.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/categorical_quiz_response_model.dart';

import '../../data/models/submit_quiz_request_model.dart';

abstract class QuizRepository{
  NetworkResult<List<CategoricalQuizResponseModel>> getQuiz({required String categoryName});
  NetworkResult<List<void>> submitQuiz(SubmitQuizRequestModel requestModel);
}