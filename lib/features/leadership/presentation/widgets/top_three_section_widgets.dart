import 'package:flutter/material.dart';
import '../../data/model/top_user_model.dart';

// class TopThreeAvatars extends StatelessWidget {
//   final List<TopUser> users;

//   const TopThreeAvatars({super.key, required this.users});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220, // MUST be taller to allow downward shift
//       width: double.infinity,
//       child: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           // 🥈 Left
//           Positioned(
//             left: 40,
//             top: 70, // 🔥 PUSH DOWN INTO BLUE PODIUM
//             child: _AvatarItem(user: users[1], size: 60, rank: 2),
//           ),

//           // 🥇 Center
//           Positioned(
//             top: 50,
//             // 🔥 CENTER IS HIGHER BUT STILL INSIDE PODIUM
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
//             top: 75, // 🔥 PUSH DOWN
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
//                 border: Border.all(color: Colors.orange, width: 3),
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
//             color: Colors.white,
//             fontSize: 13,
//             fontWeight: FontWeight.w600,
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
//             color: Colors.orange,
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         const SizedBox(height: 2),

//         // Email
//         Text(
//           user.email,
//           style: const TextStyle(color: Colors.white70, fontSize: 10),
//           textAlign: TextAlign.center,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ],
//     );
//   }
// }

// // class TopThreePodium extends StatelessWidget {
// //   final List<TopUser> users;

// //   const TopThreePodium({super.key, required this.users});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: 200,
// //       width: double.infinity,
// //       child: Stack(
// //         alignment: Alignment.bottomCenter,
// //         children: [
// //           /// 🥈 Second Position (Left)
// //           Positioned(
// //             bottom: 0,
// //             left: 32,
// //             child: TopUserCard(
// //               user: users[1],
// //               podiumHeight: 120,
// //               width: 100,
// //               position: 2,
// //             ),
// //           ),

// //           /// 🥇 First Position (Center)
// //           Positioned(
// //             bottom: 0,
// //             child: TopUserCard(
// //               user: users[0],
// //               podiumHeight: 150,
// //               width: 120,
// //               position: 1,
// //               showCrown: true,
// //             ),
// //           ),

// //           /// 🥉 Third Position (Right)
// //           Positioned(
// //             bottom: 0,
// //             right: 32,
// //             child: TopUserCard(
// //               user: users[2],
// //               podiumHeight: 100,
// //               width: 100,
// //               position: 3,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class TopUserCard extends StatelessWidget {
// //   final TopUser user;
// //   final double width;
// //   final double podiumHeight;
// //   final int position;
// //   final bool showCrown;

// //   const TopUserCard({
// //     super.key,
// //     required this.user,
// //     required this.width,
// //     required this.podiumHeight,
// //     required this.position,
// //     this.showCrown = false,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         if (showCrown)
// //           Icon(Icons.emoji_events, color: Colors.amber, size: 32),
// //         Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Container(
// //               width: width,
// //               height: width,
// //               decoration: BoxDecoration(
// //                 shape: BoxShape.circle,
// //                 border: Border.all(
// //                   color: showCrown ? Colors.amber : Colors.white,
// //                   width: 3,
// //                 ),
// //                 image: DecorationImage(
// //                   image: NetworkImage(user.image),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             Positioned(
// //               bottom: -podiumHeight + 30,
// //               child: Container(
// //                 width: width + 20,
// //                 padding: const EdgeInsets.all(8),
// //                 decoration: BoxDecoration(
// //                   color: Colors.blueAccent.withOpacity(0.9),
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Text(
// //                       user.name,
// //                       style: const TextStyle(
// //                         color: Colors.white,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     const SizedBox(height: 2),
// //                     Text(
// //                       user.score.toString(),
// //                       style: const TextStyle(
// //                         color: Colors.yellow,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 16,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 2),
// //                     Text(
// //                       user.email,
// //                       style: const TextStyle(
// //                         color: Colors.white70,
// //                         fontSize: 10,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ],
// //     );
// //   }
// // }


class TopThreeAvatars extends StatelessWidget {
  final List<TopUser> users;

  const TopThreeAvatars({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // 🥈 Left
          Positioned(
            left: 40,
            top: 35,
            child: _AvatarItem(user: users[1], size: 60, rank: 2),
          ),

          // 🥇 Center
          Positioned(
            top: 5,
            child: _AvatarItem(
              user: users[0],
              size: 80,
              rank: 1,
              showCrown: true,
            ),
          ),

          // 🥉 Right
          Positioned(
            right: 40,
            top: 35,
            child: _AvatarItem(user: users[2], size: 60, rank: 3),
          ),
        ],
      ),
    );
  }
}

class _AvatarItem extends StatelessWidget {
  final TopUser user;
  final double size;
  final int rank;
  final bool showCrown;

  const _AvatarItem({
    required this.user,
    required this.size,
    required this.rank,
    this.showCrown = false,
  });

  Color getBorderColor() {
    switch (rank) {
      case 1:
        return Color(0xFFFFAA00); // 🥇 Yellow/Orange
      case 2:
        return Color(0xFF0B4390); // 🥈 Blue
      case 3:
        return Color(0xFF82ACFF); // 🥉 Sky Blue
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar + badge + crown
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: getBorderColor(), width: 3),
                image: DecorationImage(
                  image: NetworkImage(user.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Rank badge
            Positioned(
              bottom: -6,
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

            // Crown (only #1)
            if (showCrown)
              const Positioned(
                top: -22,
                child: Image(
                  image: AssetImage('assets/images/crownIcon.png'),
                  width: 26,
                  height: 26,
                ),
              ),
          ],
        ),

        const SizedBox(height: 8),

        // Name
        Text(
          user.name,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 2),

        // Score
        Text(
          user.score.toString(),
          style: const TextStyle(
            color: Color(0xFFFFAA00),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 2),

        // Email
        Text(
          user.email,
          style: const TextStyle(color: Color(0xFFDADADA), fontSize: 9, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
