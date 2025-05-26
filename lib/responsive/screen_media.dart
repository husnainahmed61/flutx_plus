// typedef Property<T> = Map<String, T>;
//
// typedef MediaQ = Map<String, Property<int>>;

import 'package:flutx_plus/responsive/display_type.dart';

import 'screen_media_type.dart';

class FxScreenMedia {
  static int flexColumns = 12;
  static double flexSpacing = 24;

  static FxScreenMediaType getTypeFromWidth(double width) {
    for (var i in FxScreenMediaType.values) {
      if (width < i.width) {
        return i;
      }
    }
    return FxScreenMediaType.xxl;
  }

  static Map<FxScreenMediaType, T> getFilledMedia<T>(
      Map<FxScreenMediaType, T>? map, T defaultValue,
      [bool reversed = false]) {
    final Map<FxScreenMediaType, T> d = {};
    map ??= {};
    List list = FxScreenMediaType.list;
    if (reversed) {
      list = list.reversed.toList();
    }
    for (var i = 0; i < list.length; i++) {
      d[list[i]] =
          map[list[i]] ?? (i > 0 ? d[list[i - 1]] : null) ?? defaultValue;
    }
    return d;
  }

  static Map<FxScreenMediaType, int> getFlexedDataFromString(String? string) {
    string ??= '';
    final Map<FxScreenMediaType, int> d = {};

    final List<String> data = string.split(' ');
    for (String item in data) {
      for (var type in FxScreenMediaType.values) {
        if (item.contains(type.className)) {
          final int? flex = int.tryParse(item.replaceAll('${type.className}-', ''));
          if (flex != null) {
            d[type] = flex;
            break;
          }
        }
      }
    }

    return getFilledMedia(d, FxScreenMedia.flexColumns);
  }

  static Map<FxScreenMediaType, FxDisplayType> getDisplayDataFromString(
      String? string) {
    string ??= '';
    final Map<FxScreenMediaType, FxDisplayType> d = {};

    final List<String> data = string.split(' ');
    for (String item in data) {
      for (var type in FxScreenMediaType.values) {
        if (item.contains(type.className)) {
          final FxDisplayType displayType = FxDisplayType.fromString(
              item.replaceAll('${type.className}-', ''));
          d[type] = displayType;
          break;
        }
      }
    }

    return getFilledMedia(d, FxDisplayType.block);
  }
}
