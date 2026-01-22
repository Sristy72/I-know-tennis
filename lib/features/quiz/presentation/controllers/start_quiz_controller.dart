import 'package:flutter_iknow_tennis/core/base/base_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/jokes_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/screens/start_quiz_screen.dart';
import 'package:get/get.dart';

import '../../data/models/start_quiz_response_model.dart';
import '../../domain/repositories/quiz_repository.dart';

class StartQuizController extends BaseController{
  final QuizRepository _quizRepository;
  final Rx<StartQuizResponseModel?> quizInfo = Rx<StartQuizResponseModel?>(null);
  final Rx<JokesResponseModel?> jokesInfo = Rx<JokesResponseModel?>(null);

  StartQuizController(this._quizRepository);

  int get totalPoints{
    final questions = quizInfo.value?.questions;
    if(questions == null) return 0;
    return questions.fold<int>(
      0,
        (sum, q) => sum + (q.quizPoint ?? 0)
    );
  }

  Future<void> startQuiz({required String categoryId}) async{
    setLoading(true);
    setError('');
    final result = await _quizRepository.startQuiz(categoryId: categoryId);
    result.fold((failure){
      setLoading(false);
      setError(failure.message);
      Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
    }, (success){
      quizInfo.value = success.data;
      setLoading(false);
      Get.to(() => StartQuizScreen());
    });
  }

   Future<void> jokes() async{
    setLoading(true);
    setError('');
    final result = await _quizRepository.jokes();
    result.fold((failure){
      setLoading(false);
      setError(failure.message);
      Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
    }, (success){
      jokesInfo.value = success.data;
      setLoading(false);
      Get.to(() => StartQuizScreen());
    });
  }

}