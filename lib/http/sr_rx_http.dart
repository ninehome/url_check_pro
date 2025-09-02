
import 'dart:convert';
import 'package:dio/dio.dart';

import '../common_widgets/toast_utils.dart';
import 'http_manager.dart';

typedef ModelBuilder<T> = T Function(Map<String, dynamic> map);

class KDRxResponse<T> {
  int code = 0;
  bool success = false;
  Map<String, dynamic>? dataJson;
  T? data;
  List<T>? list;
  String? msg;
  int? total;

  KDRxResponse(dynamic value) {
    if (value is String) {
      value = json.decode(value);
    }
    if (value is Map<String, dynamic>) {
      dataJson = value;
      code = value['code'] ?? 0;
      msg = value['message'];
      success =  (value['code'] == 0);
    } else {
      code = 0;
      success = false;
    }
  }
}

class KDRxHttp {
  static Future<KDRxResponse<T>> get<T>(String path,
      {dynamic params,
        CancelToken? cancelToken,
        bool showHud = false,
        bool showErrorToast = true,
        Options? options,
        String? key,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        ModelBuilder? modelBuilder}) async {
    return _baseRequest(path, HttpMethod.get,
        queryParameters: params,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        showHud: showHud,
        showErrorToast: showErrorToast,
        key: key,
        modelBuilder: modelBuilder);
  }

  static Future<KDRxResponse<T>> post<T>(String path,
      {dynamic params,
        Map<String, dynamic>? pageParams,
        CancelToken? cancelToken,
        bool showHud = false,
        bool showErrorToast = true,
        String? key,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        ModelBuilder? modelBuilder}) async {
    return _baseRequest(path, HttpMethod.post,
        queryParameters: pageParams,
        data: params,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        showHud: showHud,
        showErrorToast: showErrorToast,
        key: key,
        modelBuilder: modelBuilder);
  }

  /// 基础请求
  /// T表示模型
  static Future<KDRxResponse<T>> _baseRequest<T>(
      String path, HttpMethod httpMethod,
      {data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        bool showHud = false,
        bool showErrorToast = true,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        String? key,
        ModelBuilder? modelBuilder}) async {
    if (showHud) {
      //弹窗hud
      DialogUtils.netWorkLoading();
    }


    HttpManager http = HttpManager.instance;
    return http
        .baseRequest(path, httpMethod,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress)
        .then((Response value) async {
      if (showHud) {
        DialogUtils.dismiss();
      }
      KDRxResponse<T> response = KDRxResponse<T>(value.data);
      Map<String, dynamic>? dataJson = response.dataJson;

      if (dataJson?['code'] == 40001) {
        DialogUtils.showToast(response.msg);

      }

      String dataKey = "data";
      if (key != null && key.isNotEmpty) {
        dataKey = key;
      }
      if (modelBuilder != null && dataJson != null) {
        dynamic rdata = dataJson;
        if (dataKey.contains(".")) {
          List keys = dataKey.split('.');
          for (var key in keys) {
            rdata = rdata[key];
            if (rdata is! Map<String, dynamic>) {
              break;
            }
          }
        } else {
          rdata = dataJson["data"];
        }
        if (rdata is Map<String, dynamic>) {
          response.data = modelBuilder(rdata);
        }

        if (rdata is List<dynamic>) {
          try {
            response.list = rdata.map<T>((e) => modelBuilder(e)).toList();
            response.total = dataJson["total"];
          } catch (e) {
            print(e);
          }
        }
      }
      return response;

    }).onError((DioException error, stackTrace) async {

      DialogUtils.dismiss();
      KDRxResponse<T> response = KDRxResponse<T>(null);
      response.msg = "错误${error.message}";

      return response;
    });
  }

  static String mapToQueryString(Map<String, dynamic> params)  {
    return params.entries.map( (entry) {
      final key = entry.key;
      final value = Uri.encodeComponent('${entry.value}');
      return '$key=$value';
    }).join('&');
  }
}



enum HttpMethod { get, post }

const httpMethodMap = {HttpMethod.get: "get", HttpMethod.post: "post"};

