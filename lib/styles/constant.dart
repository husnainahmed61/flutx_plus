import 'package:flutx_plus/flutx.dart';

class FxConstantData {

  FxConstantData(
      {this.containerRadius = 4, this.cardRadius = 4, this.buttonRadius = 4, this.defaultBreadCrumbItem});
  final double containerRadius;
  final double cardRadius;
  final double buttonRadius;

  final FxBreadcrumbItem? defaultBreadCrumbItem;
}

class FxConstant {
  static FxConstantData _constant = FxConstantData();

  static FxConstantData get constant => _constant;

  static void setConstant(FxConstantData constantData) {
    _constant = constantData;
  }
}
