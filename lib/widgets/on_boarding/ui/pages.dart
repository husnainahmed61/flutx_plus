/*
* File : Pages
* Version : 1.0.0
* */

import 'package:flutter/material.dart';

class FxSinglePage extends StatelessWidget {

  FxSinglePage({
    this.viewModel,
    this.percentVisible = 1.0,
  });
  final PageViewModel? viewModel;
  final double? percentVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: viewModel!.color,
        child: Opacity(
          opacity: percentVisible!,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                    transform: Matrix4.translationValues(
                        0.0, 50.0 * (1.0 - percentVisible!), 0.0),
                    child: viewModel!.content),
              ]),
        ));
  }
}

class PageViewModel {

  PageViewModel(
    this.color,
    this.content,
  );
  final Color color;
  final Widget content;
}
