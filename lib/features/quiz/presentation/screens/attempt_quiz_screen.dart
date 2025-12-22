import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutter_iknow_tennis/core/theme/app_colors.dart';

class AttemptQuizScreen extends StatelessWidget {
  const AttemptQuizScreen({super.key});

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
          child: Column(
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
                          itemCount: 5,
                          itemBuilder: (context, index) {
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
                                      '1. What is the correct score call after deuce?',
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
                                      itemCount: 4,
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
                                            Text('Advantage', style: TextStyle(color: AppColors.primaryWhite),)
                                            
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
                SecondaryButton(onPressed: (){}, text: 'Next', backgroundColor: Color(0xFF),)
              ],
            ),
        ),
      ),
    );
  }
}
