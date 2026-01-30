import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutter_iknow_tennis/core/theme/app_colors.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/attempt_quiz_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/start_quiz_controller.dart';
import 'package:get/get.dart';

import '../../../joke/presentation/widgets/quiz_popup_widgets.dart';

class AttemptQuizScreen extends StatefulWidget {
  const AttemptQuizScreen({super.key});

  @override
  State<AttemptQuizScreen> createState() => _AttemptQuizScreenState();
}

class _AttemptQuizScreenState extends State<AttemptQuizScreen> {
  final AttemptQuizController _attemptQuizController =
      Get.find<AttemptQuizController>();
  final StartQuizController startQuizController =
      Get.find<StartQuizController>();

  @override
  void initState() {
    _attemptQuizController.getQuiz(
      categoryName: startQuizController.quizInfo.value?.category?.name ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            "${startQuizController.quizInfo.value?.category?.name}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          );
        }),

        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.primaryWhite,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            if (_attemptQuizController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            if (_attemptQuizController.categoricalQuizList.isEmpty) {
              return const Center(
                child: Text(
                  'No quizzes found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(20),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.containerBorderBlueGray,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 12),
                      Center(
                        child: Text(
                          'Quiz 1',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Question  1 to ${_attemptQuizController.categoricalQuizList.length}',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Divider(color: AppColors.dividerColor),
                      SizedBox(height: 12),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            _attemptQuizController.categoricalQuizList.length,
                        itemBuilder: (context, index) {
                          final quiz =
                              _attemptQuizController.categoricalQuizList[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(20),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${index + 1}. ${quiz.quizQuestion}',
                                  style: TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: quiz.quizOptions?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Obx(() {
                                      final isSelected =
                                          _attemptQuizController
                                              .selectedAnswerIndex[quiz.sId] ==
                                          index;
                                      return GestureDetector(
                                        onTap: () {
                                          _attemptQuizController.selectAnswer(
                                            questionId: quiz.sId ?? '',
                                            optionIndex: index,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              80,
                                            ),
                                            border: Border.all(
                                              color: isSelected
                                                  ? AppColors.primaryBlue
                                                  : AppColors.primaryWhite,
                                            ),
                                          ),
                                          padding: EdgeInsets.all(8),
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              Icon(
                                                isSelected
                                                    ? Icons.radio_button_checked
                                                    : Icons.radio_button_off,
                                                color: Color(0xFF709FFF),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                quiz.quizOptions![index],
                                                style: TextStyle(
                                                  color: AppColors.primaryWhite,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 8),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SecondaryButton(
                  onPressed: () async {
                    // First fetch joke
                    await _attemptQuizController.jokes();

                    if (_attemptQuizController.jokesInfo.value == null) {
                      // fallback — submit anyway if no joke loaded
                      _attemptQuizController.submitQuiz(
                        categoryId:
                            startQuizController.quizInfo.value?.category?.id ??
                            '',
                      );
                      return;
                    }

                    // Show dialog
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Obx(() {
                          // You can show loading inside dialog if needed, but usually not necessary here
                          final jokeData =
                              _attemptQuizController.jokesInfo.value!;

                          return QuizJokeDialog(
                            jokeQuestion: jokeData.joke,
                            jokeAnswer: jokeData.jokeAnswer,
                            imageUrl: jokeData.imageUrl,
                            onContinue: () {
                              // This is called when user presses X
                              Navigator.pop(context); // close dialog

                              // NOW submit the quiz and navigate
                              _attemptQuizController.submitQuiz(
                                categoryId:
                                    startQuizController
                                        .quizInfo
                                        .value
                                        ?.category
                                        ?.id ??
                                    '',
                              );
                            },
                          );
                        });
                      },
                    );
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 16,
                    ),
                  ),
                ),

                // SecondaryButton(
                //   onPressed: () {
                //     _attemptQuizController.submitQuiz(
                //       categoryId:
                //           startQuizController.quizInfo.value?.category?.id ??
                //           '',
                //     );
                //   },
                //   child: Text(
                //     'Submit',
                //     style: TextStyle(
                //       color: AppColors.primaryWhite,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
                // SecondaryButton(
                //   onPressed: () async {
                //     await _attemptQuizController.jokes();

                //     if (_attemptQuizController.jokesInfo.value == null) {
                //       return;
                //     }

                //     await showDialog(
                //       context: context,
                //       barrierDismissible: false,
                //       builder: (context) => Obx(() {
                //         if (startQuizController.isLoading.value) {
                //           return Center(child: CircularProgressIndicator());
                //         }

                //         final jokeData = _attemptQuizController.jokesInfo.value;

                //         return QuizJokeDialog(
                //           jokeQuestion: jokeData!.joke,
                //           jokeAnswer: jokeData.jokeAnswer,
                //           onContinue: () {
                //             Navigator.pop(context);
                //             _attemptQuizController.submitQuiz(
                //               categoryId:
                //                   startQuizController
                //                       .quizInfo
                //                       .value
                //                       ?.category
                //                       ?.id ??
                //                   '',
                //             );
                //           },
                //           imageUrl: jokeData.imageUrl, // optional: show picture
                //         );
                //       }),
                //     );
                //   },
                //   child: const Text(
                //     'Submit',
                //     style: TextStyle(
                //       color: AppColors.primaryWhite,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
