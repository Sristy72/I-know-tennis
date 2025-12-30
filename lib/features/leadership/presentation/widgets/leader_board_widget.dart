import 'package:flutter/material.dart';
import '../../data/model/leaderboard_response_model.dart';
import '../../data/model/top_user_model.dart';

class LeaderboardRow extends StatelessWidget {
  final ListUser user;
  final bool isMe;

  const LeaderboardRow({super.key, required this.user, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent, // make background transparent
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF2660EF), // blue border color
          width: 2, // border thickness
        ),
      ),
      child: Row(
        children: [
          Text(
            "#${user.rank}",
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Username",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "@username",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${user.points}",
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
