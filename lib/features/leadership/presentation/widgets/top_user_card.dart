import 'package:flutter/material.dart';

import '../../data/model/top_user_model.dart';

class TopUserAvatar extends StatelessWidget {
  final TopUser user;
  final double width;
  final double height;
  final double? radius;
  final bool showCrown;

  const TopUserAvatar({
    super.key,
    required this.user,
    required this.width,
    required this.height,
    this.radius,
    this.showCrown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(user.image),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // if (showCrown)
        //   Positioned(
        //     top: -18,
        //     child: Image.asset(
        //       'assets/images/crownIcon.png',
        //       height: 22,
        //     ),
        //   ),
      ],
    );
  }
}
