import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/model/top_user_model.dart';

class LeaderboardRow extends StatelessWidget {
  final LeaderboardUser user;

  const LeaderboardRow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0E2A63),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Text("#${user.rank}",
              style: const TextStyle(color: Colors.white70)),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Username",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                Text("@username",
                    style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          Text("${user.score}",
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
