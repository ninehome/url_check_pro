
import 'package:logger/logger.dart';

class LogUtils {
  static final _logger = Logger(
    printer: PrettyPrinter(
      colors: true,
    ),
    filter: null,
    output: null,
  );

  static d(dynamic message) {
    _logger.d(message);
  }

  static i(dynamic message) {
    _logger.i(message);
  }

  static w(dynamic message) {
    _logger.w(message);
  }

  static v(dynamic message) {
    _logger.v(message);
  }

  static e(dynamic message) {
    _logger.e(message);
  }
}
