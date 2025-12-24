import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardAppBar extends StatelessWidget {
  const LeaderboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios,
                color: Colors.white, size: 20),
          ),
          const Spacer(),
          const Text(
            'Leaderboard',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
