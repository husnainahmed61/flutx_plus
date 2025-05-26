import 'package:flutter/material.dart';

class MSIcon extends StatelessWidget {

  const MSIcon(this.icon, {this.size, this.color, this.fontWeight, super.key});
  final String icon;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      icon,
      style: TextStyle(
          fontFamily: 'Symbols',
          package: 'flutx',
          color: color,
          fontWeight: fontWeight,
          fontSize: size ?? 24),
    );
  }
}
