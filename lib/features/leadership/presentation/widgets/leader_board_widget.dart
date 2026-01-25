import 'package:flutter/material.dart';
import '../../data/model/leaderboard_response_model.dart';
import '../../data/model/top_user_model.dart';

// class LeaderboardRow extends StatelessWidget {
//   final ListUser user;
//   final bool isMe;

//   const LeaderboardRow({super.key, required this.user, this.isMe = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 64,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.transparent, // make background transparent
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           color: const Color(0xFF2660EF), // blue border color
//           width: 2, // border thickness
//         ),
//       ),
//       child: Row(
//         children: [
//           Text(
//             "#${user.rank}",
//             style: const TextStyle(
//               color: Color(0xFFFFFFFF),
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(width: 12),
//           const CircleAvatar(
//             radius: 25,
//             backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   "Username",
//                   style: TextStyle(
//                     color: Color(0xFFFFFFFF),
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                   ),
//                 ),
//                 Text(
//                   "@username",
//                   style: TextStyle(
//                     color: Color(0xFFFFFFFF),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             "${user.points}",
//             style: const TextStyle(
//               color: Color(0xFFFFFFFF),
//               fontSize: 12,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../data/model/leaderboard_response_model.dart';

class LeaderboardRow extends StatelessWidget {
  final ListUser user;
  final bool isMe;

  const LeaderboardRow({
    super.key,
    required this.user,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF2660EF), // blue border
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Rank
          Text(
            "#${user.rank}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),

          // Avatar
          CircleAvatar(
            radius: 25,
            backgroundImage: user.avatar != null && user.avatar!.isNotEmpty
                ? NetworkImage(user.avatar!)
                : const NetworkImage("https://i.pravatar.cc/150"), // fallback
            backgroundColor: Colors.grey.shade800,
          ),
          const SizedBox(width: 12),

          // Name and Email/Handle
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  user.email, // You can change this to a username if you add one later
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Points
          Text(
            "${user.points}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}