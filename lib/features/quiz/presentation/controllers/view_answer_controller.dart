import 'package:flutter_iknow_tennis/features/quiz/data/models/view_result_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';

class ViewAnswerController extends BaseController{
  final QuizRepository _quizRepository;
  final Rx<ViewResultResponseModel?> quizResult = Rx<ViewResultResponseModel?>(null);

  ViewAnswerController(this._quizRepository);
  Future<void> viewResult({required String attemptId}) async{
    setLoading(true);
    setError('');
    final result = await _quizRepository.viewResult(attemptId: attemptId);
    result.fold((failure){
      setLoading(false);
      setError(failure.message);
      Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
    }, (success){
      quizResult.value = success.data;
      setLoading(false);

    });
  }

}