/// There are mainly 2 types of container .
///
/// [FxContainer.bordered] - provides border to the container.
/// [FxContainer.rounded] - provides rounded shape to the container for the given height and width of the container.
library;


import 'package:flutter/material.dart';
import 'package:flutx_plus/styles/styles.dart';

import 'package:flutx_plus/utils/spacing.dart';

class FxContainer extends StatelessWidget {

  const FxContainer(
      {Key? key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.enableBorderRadius = true,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor})
      : super(key: key);

  const FxContainer.transparent(
      {Key? key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.color = Colors.transparent,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.enableBorderRadius = true,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor})
      : super(key: key);

  const FxContainer.none(
      {Key? key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll = 0,
      this.paddingAll = 0,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.enableBorderRadius = true,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor})
      : super(key: key);

  const FxContainer.bordered(
      {Key? key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = true,
      this.enableBorderRadius = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor})
      : super(key: key);

  const FxContainer.roundBordered(
      {Key? key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.enableBorderRadius = true,
      this.paddingAll,
      this.border,
      this.bordered = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor})
      : super(key: key);

  const FxContainer.rounded(
      {Key? key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.enableBorderRadius = true,
      this.paddingAll,
      this.border,
      this.bordered = false,
      this.clipBehavior = Clip.antiAliasWithSaveLayer,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor})
      : super(key: key);
  final Widget? child;
  final BorderRadius? borderRadius;
  final double? borderRadiusAll, paddingAll, marginAll;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color;
  final Color? borderColor;
  final bool bordered;
  final Border? border;
  final Clip? clipBehavior;
  final BoxShape shape;
  final double? width, height;
  final AlignmentGeometry? alignment;
  final GestureTapCallback? onTap;
  final Color? splashColor;
  final bool enableBorderRadius;

  @override
  Widget build(BuildContext context) {
    final Widget base = Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: margin ?? FxSpacing.all(marginAll ?? 0),
      decoration: BoxDecoration(
          color: color ?? FxAppTheme.theme.cardTheme.color,
          shape: shape,
          borderRadius: enableBorderRadius
              ? (shape == BoxShape.rectangle
                  ? borderRadius ??
                      BorderRadius.all(Radius.circular(borderRadiusAll ??
                          FxConstant.constant.containerRadius))
                  : null)
              : null,
          border: bordered
              ? border ??
                  Border.all(
                      color: borderColor ?? FxAppTheme.theme.dividerColor,
                      width: 1)
              : null),
      padding: padding ?? FxSpacing.all(paddingAll ?? 16),
      clipBehavior: clipBehavior ?? Clip.none,
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        borderRadius: shape != BoxShape.circle
            ? borderRadius ??
                BorderRadius.all(Radius.circular(
                    borderRadiusAll ?? FxConstant.constant.containerRadius))
            : null,
        onTap: onTap,
        splashColor: splashColor ?? Colors.transparent,
        highlightColor: splashColor ?? Colors.transparent,
        child: base,
      );
    } else {
      return base;
    }
  }
}
