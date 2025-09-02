

//拦截器
import 'package:dio/dio.dart';

abstract class BaseHttpInterceptors extends InterceptorsWrapper {
  final String _tag = "BaseHttpInterceptors:";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    options.contentType = 'application/json';
    options.headers["Accept"] = "application/json, text/javascript, */*";

  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
    // LogUtils.i('$_tag -onError-${err.message}');
  }
}
