/// [FxMeasureSize] - measures the size of any particular widget
library;


import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

typedef OnWidgetSizeChange = void Function(Size? size);

class FxMeasureSize extends StatefulWidget {

  const FxMeasureSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final OnWidgetSizeChange onChange;

  @override
  _FxMeasureSizeState createState() => _FxMeasureSizeState();
}

class _FxMeasureSizeState extends State<FxMeasureSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;

  void postFrameCallback(_) {
    final context = widgetKey.currentContext;
    if (context == null) return;

    final newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}
