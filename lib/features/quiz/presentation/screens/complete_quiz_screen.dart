import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutter_iknow_tennis/core/theme/app_colors.dart';

class CompleteQuizScreen extends StatelessWidget {
  const CompleteQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/trophy_outlined.png',
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 10),
                Text(
                  'Quiz Completed!',
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 08,),
            Text('100% YES! Chair umpire certified. Go treat yourself to a champagne moment on Center Court.',
            style: TextStyle(color: AppColors.primaryWhite, fontSize: 12), textAlign: TextAlign.center, ),
            const SizedBox(height: 24),
            _percentageCircle(percentage: 1.0),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 86,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(colors: [
                        Color(0xFF3A8A49),
                        Color(0xFF2A60D9),
                      ])
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('20', style: TextStyle(
                          color: AppColors.textGreen,
                          fontSize: 18,
                        ),),
                        SizedBox(height: 4,),
                        Text('Correct', style: TextStyle(
                          color: AppColors.textGreen,
                          fontSize: 18,
                        ),)
                      ],
                    ),

                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 86,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                          Color(0xFF5D2647),
                          Color(0xFF2A5FDA),
                        ])
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('0', style: TextStyle(
                          color: AppColors.textRed,
                          fontSize: 18,
                        ),),
                        SizedBox(height: 4,),
                        Text('Incorrect', style: TextStyle(
                          color: AppColors.textRed,
                          fontSize: 18,
                        ),)
                      ],
                    ),

                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              height: 86,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [
                    Color(0xFFF77A17),
                    Color(0xFF2C61DA),
                  ])
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('100%', style: TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 18,
                  ),),
                  SizedBox(height: 4,),
                  Text('Points Earned', style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 18,
                  ),)
                ],
              ),

            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: SecondaryButton(onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt, color: AppColors.primaryWhite, size: 24,),
                      SizedBox(width: 10,),
                      Text('Retake Quiz', style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 16,
                      ),)
                    ],
                  ), ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SecondaryButton(
                    backgroundColor: Colors.transparent,
                    onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.visibility_off_outlined, color: AppColors.primaryWhite, size: 24,),
                      SizedBox(width: 10,),
                      Text('View Answers', style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 16,
                      ),)
                    ],
                  ), ),
                ),

              ],
            ),
            const SizedBox(height: 24),

            PrimaryButton(isGradient: false, onPressed: (){}, child: Text('Back to Home', style: TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 16,
                ),)
            ),
          ],
        ),
      ),
    );
  }
  Widget _percentageCircle({
    required double percentage,
  }) {
    const double stroke = 12;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 94,
          height: 94,
          child: CircularProgressIndicator(
            value: 1,
            strokeWidth: stroke,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(
              AppColors.textRed,
            ),
          ),
        ),

        SizedBox(
          width: 94,
          height: 94,
          child: CircularProgressIndicator(
            value: percentage,
            strokeWidth: stroke,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation(
              AppColors.textGreen // Green ring
            ),
          ),
        ),

        // Center text
        Text(
          '${(percentage * 100).toInt()}%',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

}

