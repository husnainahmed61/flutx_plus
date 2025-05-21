import 'package:flutter/material.dart';

extension ColorExtension on Color {
  double get brightness {
    return (0.299 * (this.r) + 0.587 * (this.g) + 0.114 * (this.b)) /
        2.55;
  }
}
