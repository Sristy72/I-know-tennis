import 'package:flutter/material.dart';

import '../../data/model/top_user_model.dart';
import 'top_user_card.dart';

class TopThreePodium extends StatelessWidget {
  final List<TopUser> users;

  const TopThreePodium({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          /// 🥈 Second Position (Left)
          Positioned(
            bottom: 0,
            left: 48,
            child: TopUserAvatar(
              user: users[1],
              width: 46,
              height: 46,
            ),
          ),

          /// 🥇 First Position (Center)
          Positioned(
            bottom: 28,
            left: MediaQuery.of(context).size.width / 2 - 36.5, // 73 / 2
            child: TopUserAvatar(
              user: users[0],
              width: 83,
              height: 83,
              radius: 9999,
              showCrown: true,
            ),
          ),

          /// 🥉 Third Position (Right)
          Positioned(
            bottom: 0,
            right: 48,
            child: TopUserAvatar(
              user: users[2],
              width: 46,
              height: 46,
            ),
          ),
        ],
      ),
    );
  }
}
