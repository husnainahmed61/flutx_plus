/// [FxTwoToneIcon] - provides two tone Icons.
library;


import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'two_tone_icon_data.dart';

export 'two_tone_icon_data.dart';
export 'two_tone_mdi_icons.dart';

class FxTwoToneIcon extends StatefulWidget {

  const FxTwoToneIcon(this.iconData, {this.color, this.size = 24});
  final FxTwoToneIconData iconData;
  final ColorFilter? color;
  final double? size;

  @override
  _FxTwoToneIconState createState() => _FxTwoToneIconState();
}

class _FxTwoToneIconState extends State<FxTwoToneIcon> {
  String? iconDataString;
  FxTwoToneIconData? iconData;

  @override
  void initState() {
    super.initState();
    getIconDataString();
  }

  @override
  Widget build(BuildContext context) {
    fetchCacheData();

    if (iconData != null) {
      if (!(iconData == widget.iconData)) getIconDataString();
    }

    return iconDataString == null
        ? Container()
        : SvgPicture.string(
            iconDataString!,
            colorFilter: widget.color,
            width: widget.size,
            height: widget.size,
          );
  }

  Future<void> getIconDataString() async {
    final String data = await rootBundle.loadString(widget.iconData.path);

    setState(() {
      iconDataString = data;
      iconData = widget.iconData;
    });

    FxTwoToneIconDataCache.cache[widget.iconData] = data;
  }

  void fetchCacheData() {
    iconDataString = FxTwoToneIconDataCache.cache[widget.iconData];
  }
}
