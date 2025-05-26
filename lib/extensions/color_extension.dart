import 'package:flutter/material.dart';

extension ColorExtension on Color {
  double get brightness {
    return (0.299 * (r) + 0.587 * (g) + 0.114 * (b)) /
        2.55;
  }
}
