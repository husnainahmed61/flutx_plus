import 'package:flutter/material.dart';
import 'package:flutx_plus/responsive/responsive.dart';

class FxResponsive extends StatelessWidget {

  const FxResponsive({
    super.key,
    required this.builder,
  });
  final Widget Function(BuildContext, BoxConstraints, FxScreenMediaType)
      builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => builder(
            context,
            constraints,
            FxScreenMedia.getTypeFromWidth(MediaQuery.of(context).size.width)));
  }
}
