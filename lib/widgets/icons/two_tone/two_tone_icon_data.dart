/// [FxTwoToneIconData] - gives path of the Icons.
library;


class FxTwoToneIconData {

  const FxTwoToneIconData(this.name,
      {this.extension = 'svg', this.iconPack = 'mdi'});
  final String name;
  final String extension;
  final String iconPack;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is FxTwoToneIconData &&
        name == other.name &&
        extension == other.extension &&
        iconPack == other.iconPack;
  }

  @override
  int get hashCode => super.hashCode;

  String get path {
    return 'packages/flutx_plus/assets/icons/two_tone/$iconPack/$name.$extension';
  }

  @override
  String toString() {
    return 'FxTwoToneIconData{name: $name, extension: $extension, iconPack: $iconPack}';
  }
}

class FxTwoToneIconDataCache {
  static Map<FxTwoToneIconData, String> cache = {};
}
