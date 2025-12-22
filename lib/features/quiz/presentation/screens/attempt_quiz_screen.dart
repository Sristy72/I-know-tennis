import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutter_iknow_tennis/core/theme/app_colors.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/controllers/attempt_quiz_controller.dart';
import 'package:get/get.dart';

class AttemptQuizScreen extends StatefulWidget {
  const AttemptQuizScreen({super.key});

  @override
  State<AttemptQuizScreen> createState() => _AttemptQuizScreenState();
}

class _AttemptQuizScreenState extends State<AttemptQuizScreen> {
  final AttemptQuizController _attemptQuizController = Get.find<AttemptQuizController>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar:  AppBar(
        title: Text(
          "Serving & Receiving Quiz",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx((){
            if(_attemptQuizController.isLoading.value){
              return Center(child: CircularProgressIndicator());
            }
            if(_attemptQuizController.categoricalQuizList.isEmpty){
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
                  child: Expanded(
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
                            'Question  1 to 20',
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
                          itemCount: _attemptQuizController.categoricalQuizList.length,
                          itemBuilder: (context, index) {
                            final quiz = _attemptQuizController.categoricalQuizList[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(20),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      quiz.quizQuestion ?? '',
                                      style: TextStyle(
                                          color: AppColors.primaryWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const SizedBox(height: 8,),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: quiz.quizOptions?.length ?? 0,
                                      itemBuilder: (context, index){
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(80),
                                            border: Border.all(color: AppColors.primaryWhite),
                                          ),
                                          padding: EdgeInsets.all(8),
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              Icon(Icons.circle_outlined, color: Color(0xFF709FFF),),
                                              SizedBox(width: 8,),
                                              Text(quiz.quizOptions![index], style: TextStyle(color: AppColors.primaryWhite),)

                                            ],
                                          ),
                                        );
                                      }, separatorBuilder: (context, index) => SizedBox(height: 8,),)

                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(height: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
                SecondaryButton(onPressed: (){}, text: 'Next',)
              ],
            );
          })

        ),
      ),
    );
  }
}
