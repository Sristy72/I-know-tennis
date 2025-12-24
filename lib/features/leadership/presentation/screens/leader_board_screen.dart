import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller/leader_board_controller.dart';
import '../widgets/leader_board_app_bar.dart';
import '../widgets/leader_board_widget.dart';
import '../widgets/top_three_section_widgets.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final LeaderboardController controller = Get.put(LeaderboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Leaderboard.png',
              fit: BoxFit.cover,
              
            ),
          ),
          const SizedBox(height: 12),

          SafeArea(
            child: Column(
              children: [
                /// AppBar
                const LeaderboardAppBar(),

                const SizedBox(height: 12),

                /// Top 3 Section (aligned to podium)
                TopThreePodium(users: controller.topUsers),

                const SizedBox(height: 14),

                /// Leaderboard List
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (_, i) =>
                        LeaderboardRow(user: controller.leaderboard[i]),
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                    itemCount: controller.leaderboard.length,
                  ),
                ),

                // const ShareButton(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
