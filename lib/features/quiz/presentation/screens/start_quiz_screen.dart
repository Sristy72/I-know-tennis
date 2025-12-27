import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutter_iknow_tennis/core/theme/app_colors.dart';
import 'package:flutter_iknow_tennis/features/quiz/presentation/screens/attempt_quiz_screen.dart';
import 'package:get/get.dart';

import '../../../Home/data/model/quiz_category_response_model.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key, required this.quiz});

  final QuizCategoryResponse quiz;

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
      removePadding: true,
        body: Column(
      children: [
        SafeArea(child: AppBar(
          title: Text("Serving & Receiving Quiz", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: AppColors.primaryWhite,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text('Test your knowledge of USTA Tennis Association official rules.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryWhite
                ),),
              SizedBox(height: 12,),
              Container(
                height: 160,
                width: double.maxFinite,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.containerBorderBlue),
                  gradient: LinearGradient(colors: [
                    Color(0xFF164281),
                    Color(0xFF224C93),
                    Color(0xFF164281),
                  ])
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColors.iconContainerBG,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/trophy.png', height: 40, width: 32),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Text('${quiz.quizCount}', style: TextStyle(
                              color: AppColors.textCyan,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),),
                            SizedBox(height: 4,),
                            Text('Questions', style: TextStyle(
                              color: AppColors.primaryWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                            ),)
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text('${quiz.quizPoint}', style: TextStyle(
                              color: AppColors.textAmber,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),),
                            SizedBox(height: 4,),
                            Text('Points', style: TextStyle(
                              color: AppColors.primaryWhite,
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),)
                          ],
                        ),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 12,),
              PrimaryButton(isGradient: false, onPressed: (){
                Get.to(() => AttemptQuizScreen(quiz: quiz,));
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_outline, color: AppColors.primaryWhite, size: 24,),
                  SizedBox(width: 10,),
                  Text('Start Quiz', style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 16,
                  ),)
                ],
              ),
              ),
            ],
          ),
        )

      ],
    ));
  }
}
