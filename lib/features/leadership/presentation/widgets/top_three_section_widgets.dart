

import 'package:flutter/material.dart';
import '../../data/model/leaderboard_response_model.dart';
import '../../data/model/top_user_model.dart';

// class TopThreePodium extends StatelessWidget {
//   final List<TopUser> users;

//   const TopThreePodium({super.key, required this.users});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         // 🥈 Second place
//         _podiumItem(user: users[1], height: 140, rank: 2),
//         // 🥇 First place
//         _podiumItem(user: users[0], height: 190, rank: 1, isWinner: true),
//         // 🥉 Third place
//         _podiumItem(user: users[2], height: 140, rank: 3),
//       ],
//     );
//   }

//   Color _getBorderColor(int rank) {
//     switch (rank) {
//       case 1:
//         return const Color(0xFFFFAA00); // Gold
//       case 2:
//         return const Color(0xFF0B4390); // Silver/Blue
//       case 3:
//         return const Color(0xFF82ACFF); // Bronze/Sky
//       default:
//         return Colors.grey;
//     }
//   }

//   Color _getPodiumColor(int rank) {
//     // Middle (1st place) dark blue, others sky blue
//     if (rank == 1) {
//       return const Color(0xFF3377FF); // Dark Blue
//     } else {
//       return const Color(0xFF3170F0); // Sky Blue
//     }
//   }

//   Widget _podiumItem({
//     required TopUser user,
//     required double height,
//     required int rank,
//     bool isWinner = false,
//   }) {
//     double avatarSize = isWinner ? 70 : 60;
//     double topPadding = isWinner ? 24 : 12; // adjust top padding for winner

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Podium block
//         Container(
//           width: 120,
//           height: height,
//           decoration: BoxDecoration(
//             color: _getPodiumColor(rank),
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(isWinner ? 36 : 28),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: topPadding), // <-- adjusted padding
//               // Avatar + crown + rank badge
//               Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.topCenter,
//                 children: [
//                   // Avatar
//                   Container(
//                     height: avatarSize,
//                     width: avatarSize,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: _getBorderColor(rank),
//                         width: 3,
//                       ),
//                     ),
//                     child: ClipOval(
//                       child: (user.avatar?.isNotEmpty ?? false)
//                           ? Image.network(user.avatar!, fit: BoxFit.cover)
//                           : const Icon(
//                               Icons.person,
//                               size: 32,
//                               color: Colors.white,
//                             ),
//                     ),
//                   ),

//                   // Crown for winner
//                   if (isWinner)
//                     Positioned(
//                       top: -20,
//                       child: Image.asset(
//                         'assets/images/crownIcon.png',
//                         width: 26,
//                         height: 26,
//                       ),
//                     ),

//                   // Rank badge
//                   Positioned(
//                     bottom: -10,
//                     child: Container(
//                       width: 22,
//                       height: 22,
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black,
//                       ),
//                       child: Text(
//                         rank.toString(),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 11,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 8),

//               // Name
//               Text(
//                 user.fullName,
//                 style: const TextStyle(
//                   color: Color(0xFFFFFFFF),
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),

//               // Score
//               Text(
//                 user.points.toString(),
//                 style: const TextStyle(
//                   color: Color(0xFFFFAA00),
//                   fontSize: 15,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),

//               // Email
//               // Text(
//               //   user.email,
//               //   style: const TextStyle(
//               //     color: Color(0xFFDADADA),
//               //     fontSize: 10,
//               //     fontWeight: FontWeight.w400,
//               //   ),
//               //   textAlign: TextAlign.center,
//               //   maxLines: 1,
//               //   overflow: TextOverflow.ellipsis,
//               // ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class TopThreePodium extends StatelessWidget {
  final List<TopUser> users;

  const TopThreePodium({super.key, required this.users});

  // Safely get user at index, return null if not available
  TopUser? _safeGet(int index) => index < users.length ? users[index] : null;

  @override
  Widget build(BuildContext context) {
    final TopUser? first = _safeGet(0);
    final TopUser? second = _safeGet(1);
    final TopUser? third = _safeGet(2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // 🥈 Second place
        _podiumItem(
          user: second,
          height: 140,
          rank: 2,
        ),
        // 🥇 First place (tallest)
        _podiumItem(
          user: first,
          height: 190,
          rank: 1,
          isWinner: true,
        ),
        // 🥉 Third place
        _podiumItem(
          user: third,
          height: 140,
          rank: 3,
        ),
      ],
    );
  }

  // Your existing color methods remain unchanged
  Color _getBorderColor(int rank) {
    switch (rank) {
      case 1: return const Color(0xFFFFAA00); // Gold
      case 2: return const Color(0xFF0B4390); // Silver
      case 3: return const Color(0xFF82ACFF); // Bronze
      default: return Colors.grey;
    }
  }

  Color _getPodiumColor(int rank) {
    return rank == 1
        ? const Color(0xFF3377FF)
        : const Color(0xFF3170F0);
  }

  Widget _podiumItem({
    required TopUser? user,
    required double height,
    required int rank,
    bool isWinner = false,
  }) {
    double avatarSize = isWinner ? 70 : 60;
    double topPadding = isWinner ? 24 : 12;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: height,
          decoration: BoxDecoration(
            color: _getPodiumColor(rank),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(isWinner ? 36 : 28),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: topPadding),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  // Avatar placeholder (gray person icon if no user)
                  Container(
                    height: avatarSize,
                    width: avatarSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _getBorderColor(rank),
                        width: 3,
                      ),
                      color: Colors.grey[800], // subtle background
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.white70,
                    ),
                  ),
                  // Crown only if there's a winner
                  if (isWinner && user != null)
                    Positioned(
                      top: -20,
                      child: Image.asset(
                        'assets/images/crownIcon.png',
                        width: 26,
                        height: 26,
                      ),
                    ),
                  // Rank badge (always shown)
                  Positioned(
                    bottom: -10,
                    child: Container(
                      width: 22,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Text(
                        rank.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Name — show placeholder if no user
              Text(
                user?.fullName ?? "—",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Points — show 0 or dash
              Text(
                user != null ? user.points.toString() : "0",
                style: const TextStyle(
                  color: Color(0xFFFFAA00),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


  // class TopThreeAvatars extends StatelessWidget {
  //   final List<TopUser> users;

  //   const TopThreeAvatars({super.key, required this.users});

  //   @override
  //   Widget build(BuildContext context) {
  //     return SizedBox(
  //       height: 220,
  //       width: double.infinity,
  //       child: Stack(
  //         alignment: Alignment.topCenter,
  //         children: [
  //           // 🥈 Left
  //           Positioned(
  //             left: 40,
  //             top: 35,
  //             child: _AvatarItem(user: users[1], size: 60, rank: 2),
  //           ),

  //           // 🥇 Center
  //           Positioned(
  //             top: 5,
  //             child: _AvatarItem(
  //               user: users[0],
  //               size: 80,
  //               rank: 1,
  //               showCrown: true,
  //             ),
  //           ),

  //           // 🥉 Right
  //           Positioned(
  //             right: 40,
  //             top: 35,
  //             child: _AvatarItem(user: users[2], size: 60, rank: 3),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  // class _AvatarItem extends StatelessWidget {
  //   final TopUser user;
  //   final double size;
  //   final int rank;
  //   final bool showCrown;

  //   const _AvatarItem({
  //     required this.user,
  //     required this.size,
  //     required this.rank,
  //     this.showCrown = false,
  //   });

  //   Color getBorderColor() {
  //     switch (rank) {
  //       case 1:
  //         return Color(0xFFFFAA00); // 🥇 Yellow/Orange
  //       case 2:
  //         return Color(0xFF0B4390); // 🥈 Blue
  //       case 3:
  //         return Color(0xFF82ACFF); // 🥉 Sky Blue
  //       default:
  //         return Colors.grey;
  //     }
  //   }

  //   @override
  //   Widget build(BuildContext context) {
  //     return Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         // Avatar + badge + crown
  //         Stack(
  //           clipBehavior: Clip.none,
  //           alignment: Alignment.center,
  //           children: [
  //             Container(
  //               width: size,
  //               height: size,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 border: Border.all(color: getBorderColor(), width: 3),
  //                 image: DecorationImage(
  //                   image: NetworkImage(user.image),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),

  //             // Rank badge
  //             Positioned(
  //               bottom: -6,
  //               child: Container(
  //                 width: 22,
  //                 height: 22,
  //                 alignment: Alignment.center,
  //                 decoration: const BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: Colors.black,
  //                 ),
  //                 child: Text(
  //                   rank.toString(),
  //                   style: const TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 11,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ),

  //             // Crown (only #1)
  //             if (showCrown)
  //               const Positioned(
  //                 top: -22,
  //                 child: Image(
  //                   image: AssetImage('assets/images/crownIcon.png'),
  //                   width: 26,
  //                   height: 26,
  //                 ),
  //               ),
  //           ],
  //         ),

  //         const SizedBox(height: 8),

  //         // Name
  //         Text(
  //           user.name,
  //           style: const TextStyle(
  //             color: Color(0xFFFFFFFF),
  //             fontSize: 12,
  //             fontWeight: FontWeight.w500,
  //           ),
  //           textAlign: TextAlign.center,
  //           maxLines: 1,
  //           overflow: TextOverflow.ellipsis,
  //         ),

  //         const SizedBox(height: 2),

  //         // Score
  //         Text(
  //           user.score.toString(),
  //           style: const TextStyle(
  //             color: Color(0xFFFFAA00),
  //             fontSize: 15,
  //             fontWeight: FontWeight.w700,
  //           ),
  //         ),

  //         const SizedBox(height: 2),

  //         // Email
  //         Text(
  //           user.email,
  //           style: const TextStyle(color: Color(0xFFDADADA), fontSize: 9, fontWeight: FontWeight.w400),
  //           textAlign: TextAlign.center,
  //           maxLines: 1,
  //           overflow: TextOverflow.ellipsis,
  //         ),
  //       ],
  //     );
  //   }
  // }

