import 'package:flutx_plus/exceptions/base_exception.dart';

class RouteException extends BaseException {

  RouteException(this.message);
  final String message;

  @override
  String toString() {
    return 'RouteException{message: $message}';
  }
}
