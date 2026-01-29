import 'package:flutter_iknow_tennis/core/base/base_controller.dart';
import 'package:flutter_iknow_tennis/core/network/models/pagination_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/categorical_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/data/models/submit_quiz_response_model.dart';
import 'package:flutter_iknow_tennis/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/screens/complete_quiz_screen.dart';
import 'package:get/get.dart';

import '../../data/models/jokes_response_model.dart';
import '../../data/models/submit_quiz_request_model.dart';

class AttemptQuizController extends BaseController{
  final QuizRepository _quizRepository;

  RxList<CategoricalQuizResponseModel> categoricalQuizList = <CategoricalQuizResponseModel>[].obs;
  Rx<PaginationModel?> pagination = Rx<PaginationModel?>(null);
  Rx<SubmitQuizResponseModel?> submitQuizResponseModel = Rx<SubmitQuizResponseModel?>(null);
  final Rx<JokesResponseModel?> jokesInfo = Rx<JokesResponseModel?>(null);

  RxMap<String, int> selectedAnswerIndex = <String, int>{}.obs;

  void selectAnswer({
    required String questionId,
    required int optionIndex,
  }) {
    selectedAnswerIndex[questionId] = optionIndex;
  }


  AttemptQuizController(this._quizRepository);

  Future<void> getQuiz({required String categoryName}) async{
    setLoading(true);
    setError('');
    final result = await _quizRepository.getQuiz(categoryName: categoryName);
    result.fold((failure){
      setLoading(false);
      setError(failure.message);
      Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
    }, (success){
      setLoading(false);
      pagination.value = success.pagination;
      categoricalQuizList.assignAll(success.data);
    });
  }

  Future<void> submitQuiz({required String categoryId}) async{
    setLoading(true);
    setError('');
    final List<Answers> answers = [];

    for (final quiz in categoricalQuizList) {
      final selectedIndex = selectedAnswerIndex[quiz.sId];

      if (selectedIndex == null) continue;

      final selectedOption = quiz.quizOptions![selectedIndex];

      answers.add(
        Answers(
          questionId: quiz.sId,
          selectedOption: selectedOption,
        ),
      );
    }


    final requestModel = SubmitQuizRequestModel(
      categoryId: categoryId,
      answers: answers,
    );

    final result = await _quizRepository.submitQuiz(requestModel);
    result.fold((failure){
      setLoading(false);
      setError(failure.message);
      Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
    }, (success){
      submitQuizResponseModel.value = success.data;
      setLoading(false);
      Get.off(() => CompleteQuizScreen());
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
      Get.to(() => CompleteQuizScreen());
    });
  }

}