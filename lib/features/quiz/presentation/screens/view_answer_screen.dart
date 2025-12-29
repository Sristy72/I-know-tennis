import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutter_iknow_tennis/core/theme/app_colors.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/screens/dashboard_screen.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/start_quiz_controller.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/view_answer_controller.dart';
import 'package:get/get.dart';

class ViewAnswerScreen extends StatefulWidget {
  const ViewAnswerScreen({super.key, required this.attemptId});

  final String attemptId;

  @override
  State<ViewAnswerScreen> createState() => _ViewAnswerScreenState();
}

class _ViewAnswerScreenState extends State<ViewAnswerScreen> {
  final ViewAnswerController _viewAnswerController =
      Get.find<ViewAnswerController>();
  final StartQuizController startQuizController =
      Get.find<StartQuizController>();

  @override
  void initState() {
    _viewAnswerController.viewResult(attemptId: widget.attemptId);
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
            if (_viewAnswerController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            if (_viewAnswerController.quizResult.value == null) {
              return const Center(
                child: Text(
                  'Quiz result not found!',
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
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            _viewAnswerController
                                .quizResult
                                .value
                                ?.answers
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          final quizAnswer = _viewAnswerController
                              .quizResult
                              .value
                              ?.answers?[index];
                          final bool? isCorrect = quizAnswer?.isCorrect;
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(20),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      isCorrect == true
                                          ? Icons.check_circle_outline_outlined
                                          : Icons.cancel_outlined,
                                      size: 18,
                                      color: isCorrect == true
                                          ? AppColors.primaryGreen
                                          : AppColors.primaryRed,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Question ${index + 1}',
                                      style: TextStyle(
                                        color: AppColors.primaryWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${index + 1}. ${quizAnswer?.question?.quizQuestion}',
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
                                  itemCount:
                                      quizAnswer
                                          ?.question
                                          ?.quizOptions
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    final quizOption = quizAnswer
                                        ?.question
                                        ?.quizOptions?[index];
                                    final correctOption =
                                        quizAnswer?.correctOption;
                                    final selectedOption =
                                        quizAnswer?.selectedOption;

                                    final isCorrectOption =
                                        correctOption == quizOption;
                                    final isWrongOption = isCorrect == true
                                        ? false
                                        : selectedOption == quizOption;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: isCorrectOption
                                            ? AppColors.primaryGreen.withAlpha(60)
                                            : isWrongOption
                                            ? AppColors.primaryRed.withAlpha(60)
                                            : null,
                                        borderRadius: BorderRadius.circular(80),
                                        border: Border.all(
                                          color: isCorrectOption
                                              ? AppColors.primaryGreen
                                              : isWrongOption
                                              ? AppColors.primaryRed
                                              : AppColors.primaryWhite,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          Text(
                                            '$quizOption',
                                            style: TextStyle(
                                              color: AppColors.primaryWhite,
                                            ),
                                          ),
                                          Spacer(),
                                          if (isCorrectOption)
                                            Container(
                                              width: 59,
                                              height: 25,

                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColors.primaryGreen,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Correct',
                                                style: TextStyle(
                                                  color: AppColors.primaryWhite,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          if (isWrongOption)
                                            Container(
                                              width: 62,
                                              height: 25,

                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColors.primaryRed,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Incorrect',
                                                style: TextStyle(
                                                  color: AppColors.primaryWhite,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
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
                  onPressed: () {
                    Get.offAll(() => DashboardScreen());
                  },
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
