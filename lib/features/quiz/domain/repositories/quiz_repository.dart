import 'package:flutter_iknow_tennis/core/network/network_result.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/categorical_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/quiz_summary_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/start_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/submit_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/view_result_model.dart';

import '../../data/models/jokes_response_model.dart';
import '../../data/models/submit_quiz_request_model.dart';

abstract class QuizRepository{
  NetworkResult<StartQuizResponseModel> startQuiz({required String categoryId});
  NetworkResult<List<CategoricalQuizResponseModel>> getQuiz({required String categoryName});
  NetworkResult<SubmitQuizResponseModel> submitQuiz(SubmitQuizRequestModel requestModel);
  NetworkResult<QuizSummaryResponseModel> quizSummary({required String attemptId});
  NetworkResult<ViewResultResponseModel> viewResult({required String attemptId});
    NetworkResult<JokesResponseModel> jokes();
}