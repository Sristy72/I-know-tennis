import '../../../core/network/network_result.dart';
import '../data/model/quiz_category_response_model.dart';
import '../data/model/quiz_response_model.dart';

abstract class HomeRepository {
 NetworkResult<List<QuizResponseModel>> getAllQuiz();
  NetworkResult<List<QuizCategoryResponse>> getAllQuizCat();
}
