import 'package:flutter_iknow_tennis/core/base/base_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/quiz_summary_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/attempt_quiz_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/screens/complete_quiz_screen.dart';
import 'package:get/get.dart';

import '../../data/models/jokes_response_model.dart';

class CompleteQuizController extends BaseController{
  final QuizRepository _quizRepository;
  final Rx<QuizSummaryResponseModel?> quizSummary = Rx<QuizSummaryResponseModel?>(null);
  final AttemptQuizController attemptQuizController = Get.find<AttemptQuizController>();


  @override
  void onInit() {
    getQuizSummary(attemptId: attemptQuizController.submitQuizResponseModel.value?.attemptId ?? '');
    super.onInit();
  }


  CompleteQuizController(this._quizRepository);
  Future<void> getQuizSummary({required String attemptId}) async{
    setLoading(true);
    setError('');
    final result = await _quizRepository.quizSummary(attemptId: attemptId);
    result.fold((failure){
      setLoading(false);
      setError(failure.message);
      Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
      }, (success){
      quizSummary.value = success.data;
      setLoading(false);

    });
  }


}