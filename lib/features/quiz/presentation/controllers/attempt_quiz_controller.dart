import 'package:flutter_iknow_tennis/core/base/base_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/categorical_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/attempt_quiz_repository.dart';
import 'package:flutx_core/flutx_core.dart';
import 'package:get/get.dart';

class AttemptQuizController extends BaseController{
  final AttemptQuizRepository _attemptQuizRepository;

  RxList<CategoricalQuizResponseModel> categoricalQuizList = <CategoricalQuizResponseModel>[].obs;

  @override
  void onInit() {
    getQuiz();
    super.onInit();
  }

  AttemptQuizController(this._attemptQuizRepository);

  Future<void> getQuiz() async{
    setLoading(true);
    setError('');
    final result = await _attemptQuizRepository.getQuiz();
    result.fold((failure){
      setLoading(false);
      setError(failure.message);
      Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
    }, (success){
      setLoading(false);
      DPrint.log("Quiz Pagination: ${success.pagination?.page ?? 1}");
      categoricalQuizList.assignAll(success.data);
    });
  }
}