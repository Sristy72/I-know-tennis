import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/features/leadership/presentation/screens/leader_board_screen.dart';
import 'package:flutter_iknow_tennis/features/other/presentation/controller/gain_controller.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/theme/app_buttoms.dart';
import '../../../../core/theme/app_colors.dart';
import 'dashboard_screen.dart';

class GainScreen extends StatefulWidget {
  const GainScreen({super.key});

  @override
  State<GainScreen> createState() => _GainScreenState();
}

class _GainScreenState extends State<GainScreen> {
  final GainController _gainController = Get.find<GainController>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Gain'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.primaryWhite,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Obx(() {
              final leaderboardSummary =
                  _gainController.leaderboardSummary.value;
              return Column(
                children: [
                  Text(
                    '${leaderboardSummary?.message}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.primaryWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Hold your position like a lion. You are the king of the forest.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    'assets/images/tennis_trophy.png',
                    width: 141,
                    height: 160,
                  ),
                  const SizedBox(height: 9),
                  Container(
                    height: 169,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryBlue),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF726148),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/trophy_outlined.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Performance Score',
                              style: TextStyle(
                                color: AppColors.primaryWhite,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(width: 8),
                            _percentageCircle(
                              percentage:
                                  leaderboardSummary
                                      ?.performance
                                      ?.accuracyPercent ??
                                  0,
                              color: Color(0xFF3377FF),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${leaderboardSummary?.points}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.textAmber,
                                    ),
                                  ),
                                  Text(
                                    'points',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.textAmber,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'points earned',
                                        style: TextStyle(
                                          color: AppColors.primaryWhite,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${leaderboardSummary?.performance?.accuracyPercent}%',
                                        style: TextStyle(
                                          color: AppColors.primaryWhite,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  _percentageLine(percentage: leaderboardSummary?.performance?.accuracyPercent ?? 0),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Keep practicing',
                                    style: TextStyle(
                                      color: AppColors.primaryWhite,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryBlue),
                          ),
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Completed',
                                style: TextStyle(
                                  color: AppColors.primaryWhite,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Quizzes',
                                style: TextStyle(
                                  color: AppColors.primaryWhite,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _percentageCircle(
                                percentage:
                                    leaderboardSummary
                                        ?.categoryProgress
                                        ?.completedPercent ??
                                    0,
                                color: AppColors.primaryGreen,
                                child: Text(
                                  '${leaderboardSummary?.categoryProgress?.completedPercent}%',
                                  style: TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryBlue),
                          ),
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pending',
                                style: TextStyle(
                                  color: AppColors.primaryWhite,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Quizzes',
                                style: TextStyle(
                                  color: AppColors.primaryWhite,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _percentageCircle(
                                percentage:
                                    leaderboardSummary
                                        ?.categoryProgress
                                        ?.pendingPercent ??
                                    0,
                                color: AppColors.primaryRed,
                                child: Text(
                                  '${leaderboardSummary?.categoryProgress?.pendingPercent}%',
                                  style: TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  SecondaryButton(
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.primaryBlue,
                    onPressed: () {
                      Get.to(() => LeaderboardScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Show Leader board',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  PrimaryButton(
                    isGradient: false,
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
                  const SizedBox(height: 45),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _percentageCircle({
    required int percentage,
    required Color color,
    required Widget child,
  }) {
    const double stroke = 12;
    final double progress = (percentage / 100).clamp(0.0, 1.0);

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
            valueColor: AlwaysStoppedAnimation(AppColors.primaryWhite),
          ),
        ),

        SizedBox(
          width: 94,
          height: 94,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: stroke,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),

        child,
      ],
    );
  }

  Widget _percentageLine({required int percentage}) {



    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final double progressWidth = maxWidth * (percentage / 100);

        return Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: progressWidth,
              decoration: BoxDecoration(
                color: Color(0xFF3377FF),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }
}
