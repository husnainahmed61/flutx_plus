import 'package:flutter/material.dart';
import 'package:flutx_plus/flutx.dart';

class FxBreadcrumb extends StatelessWidget {

  FxBreadcrumb({super.key, required this.children, this.hideOnMobile = true}){
    if (FxConstant.constant.defaultBreadCrumbItem != null) {
      children.insert(0, FxConstant.constant.defaultBreadCrumbItem!);
    }
  }
  final List<FxBreadcrumbItem> children;
  final bool hideOnMobile;

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = [];
    for (int i = 0; i < children.length; i++) {
      final item = children[i];
      if (item.active || item.route == null) {
        list.add(FxText.labelMedium(
          children[i].name,
          fontWeight: 500,
          fontSize: 13,
          letterSpacing: 0,
        ));
      } else {
        list.add(InkWell(
            onTap: () => {if (item.route != null) FxRouter.pushReplacementNamed(context, item.route!)},
            child: FxText.labelMedium(
              children[i].name,
              fontWeight: 500,
              fontSize: 13,
              letterSpacing: 0,
              color: colorScheme.primary,
            )));
      }
      if (i < children.length - 1) {
        list.add(FxSpacing.width(10));
        list.add(FxText('>'));
        list.add(FxSpacing.width(10));
      }
    }
    return FxResponsive(builder: (_, __, type) {
      return type.isMobile && hideOnMobile ? SizedBox() : Row(mainAxisSize: MainAxisSize.min, children: list);
    });
  }
}
