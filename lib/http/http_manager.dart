import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../utils/sr_log_utils.dart';
import 'DomainService.dart';
import 'interceptors/header_interceptors.dart';
import 'interceptors/storage_cache_interceptor.dart';
import 'sr_rx_http.dart';

/// 网络请求
class HttpManager {


  factory HttpManager() => _getInstance();
  static HttpManager get instance => _getInstance();
  static HttpManager? _instance;
  static HttpManager _getInstance() {
    _instance ??= HttpManager._internal();
    return _instance!;
  }
  DomainService domainService = Get.find<DomainService>();
  static   Dio? _dio;

  HttpManager._internal() {

    if(_dio==null){
      _dio = Dio();
      _dio!.options = BaseOptions(
        contentType: 'application/json',
        connectTimeout: const Duration(milliseconds: 30000) ,
        receiveTimeout: const Duration(milliseconds: 30000) ,
        sendTimeout: const Duration(milliseconds: 30000) ,
        baseUrl: domainService.currentDomain,
      );

      final storage = GetStorage();

        _dio!.interceptors.add(
          StorageCacheInterceptor(
            storage,
            cacheDuration: Duration(minutes: 5), //缓存清理时间
            noCacheUrls: [], // 不缓存的请求路由
          ),
        );

        _dio!.interceptors.add(SrHeaderInterceptor());
        _dio!.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
        //能完整格式输出的日志
        _dio!.interceptors.addAll([
          _domainInterceptor(),
          _requestLoggerInterceptor(),
          _responseLoggerInterceptor(),
        ]);
      // }


    }

  }

  Future<Response<T>> baseRequest<T>(String path, HttpMethod httpMethod,
      {data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress}) async {
    if (data != null) {
      LogUtils.w("参数body:${data.toString()}");
    }
    if (queryParameters != null) {
      LogUtils.w("参数param：${queryParameters.toString()}");
    }
    var res = await _dio!.request<T>(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(method: httpMethodMap[httpMethod]),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

    if (res.statusCode != 200) {
      LogUtils.e('错误码：${res.statusCode} 错误信息：${res.statusMessage}');
    }
    return res;
  }



  _requestLoggerInterceptor() {
    return TalkerDioLogger(
      settings: TalkerDioLoggerSettings(
        printResponseMessage: false,
        printResponseHeaders: false,
        printResponseData: false,
        printRequestData: true,
        printRequestHeaders: false,
        requestFilter: _requestLogFilter,
        responseFilter: (response) => false,
      ),
    );
  }

  _responseLoggerInterceptor() {
    return TalkerDioLogger(
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: false,
        printRequestData: false,
        printResponseMessage: false,
        printResponseHeaders: false,
        printResponseData: true,
        requestFilter: (requestOptions) => false,
        responseFilter: _responseLogFilter,
      ),
    );
  }

  bool _requestLogFilter(RequestOptions? requestOptions) {

    return true;
  }

  bool _responseLogFilter(Response? response) {
    return true;
  }

  _domainInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = domainService.currentDomain;
        return handler.next(options);
      },
    );
  }

}
