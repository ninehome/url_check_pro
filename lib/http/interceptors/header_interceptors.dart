

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'base_interceptors.dart';


class SrHeaderInterceptor extends BaseHttpInterceptors {

  bool isRefresh = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    SharedPreferences prefs =  await SharedPreferences.getInstance();
    // String? userKeyToken =  prefs.getString(AppCoreData.userKey);

    //添加请求头信息

    options.headers["appVersion"] = '1.0.0';

    // options.headers["token"] = userKeyToken ?? '';


    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 在这里获取返回的请求头

    super.onResponse(response, handler);
  }
}