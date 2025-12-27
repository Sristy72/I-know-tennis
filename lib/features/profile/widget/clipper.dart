import 'package:flutter/material.dart';

class SubscriptionWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.6);

    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.85,
      size.width * 0.5,
      size.height * 0.64,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.5,
      size.width,
      size.height * 0.04,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}


class SubscriptionWaveClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.6);

    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.85,
      size.width * 0.5,
      size.height * 0.64,
    );

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.3,
      size.width * 0,
      size.height * 0.0,
    );

    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

