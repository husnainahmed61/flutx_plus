/*
* File : Page Reveal
* Version : 1.0.0
* */

import 'dart:math';
import 'package:flutter/material.dart';

class FxPageReveal extends StatelessWidget {

  FxPageReveal({this.revealPercent, this.child});
  final double? revealPercent;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: CircleRevealClipper(revealPercent),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {

  CircleRevealClipper(this.revealPercent);
  final double? revealPercent;

  @override
  Rect getClip(Size size) {
    final epicenter = Offset(size.width / 2, size.height * 0.9);

    final double theta = atan(epicenter.dy / epicenter.dx);
    final distanceToCorner = epicenter.dy / sin(theta);

    final radius = distanceToCorner * revealPercent!;
    final diameter = 2 * radius;

    return Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
