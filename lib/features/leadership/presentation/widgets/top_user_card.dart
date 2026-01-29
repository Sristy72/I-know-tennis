import 'package:flutter/material.dart';

import '../../data/model/leaderboard_response_model.dart';
import '../../data/model/top_user_model.dart';

// class TopUserAvatar extends StatelessWidget {
//   final TopUser user;
//   final double width;
//   final double height;
//   final double? radius;
//   final bool showCrown;

//   const TopUserAvatar({
//     super.key,
//     required this.user,
//     required this.width,
//     required this.height,
//     this.radius,
//     this.showCrown = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.center,
//       children: [
//         Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               image: NetworkImage(user.image),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),

//         // if (showCrown)
//         //   Positioned(
//         //     top: -18,
//         //     child: Image.asset(
//         //       'assets/images/crownIcon.png',
//         //       height: 22,
//         //     ),
//         //   ),
//       ],
//     );
//   }
// }
class TopUserCard extends StatelessWidget {
  final TopUser user;
  final double width;
  final double podiumHeight;
  final int position;
  final double? radius;
  final bool showCrown;

  const TopUserCard({
    super.key,
    required this.user,
    required this.width,
    required this.podiumHeight,
     this.radius,

    required this.position,

    this.showCrown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showCrown) Icon(Icons.emoji_events, color: Colors.amber, size: 32),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: showCrown ? Colors.amber : Colors.white,
                  width: 3,
                ),
                image: DecorationImage(
                  image: NetworkImage(user.avatar ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -podiumHeight + 30,
              child: Container(
                width: width + 20,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      user.fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.points.toString(),
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Text(
                    //   user.email,
                    //   style: const TextStyle(
                    //     color: Colors.white70,
                    //     fontSize: 10,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
