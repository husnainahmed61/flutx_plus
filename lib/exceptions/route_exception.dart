import 'package:flutx_plus/exceptions/base_exception.dart';

class RouteException extends BaseException {
  final String message;

  RouteException(this.message);

  @override
  String toString() {
    return 'RouteException{message: $message}';
  }
}
