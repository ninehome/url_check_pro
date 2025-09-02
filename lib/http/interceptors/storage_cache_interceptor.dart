import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

//http请求缓存的 中间件
class StorageCacheInterceptor extends Interceptor {
  final GetStorage storage;
  final Duration cacheDuration;
  final List<String> noCacheUrls;   // 不缓存的接口
  final List<String> onlyCacheUrls; // 只缓存的接口

  StorageCacheInterceptor(
      this.storage, {
        this.cacheDuration = const Duration(minutes: 5),
        this.noCacheUrls = const [],
        this.onlyCacheUrls = const [],
      });

  bool _shouldCache(String url) {
    if (onlyCacheUrls.isNotEmpty) {
      // 开启白名单模式 → 只有匹配的才缓存
      return onlyCacheUrls.any((e) => url.contains(e));
    }
    // 默认缓存，除非在黑名单里
    return !noCacheUrls.any((e) => url.contains(e));
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final key = options.uri.toString();

    if (!_shouldCache(key)) {
      //  不需要缓存，直接走网络
      return super.onRequest(options, handler);
    }

    final cacheData = storage.read(key);

    if (cacheData != null) {
      final expireTime = DateTime.parse(cacheData['expireTime']);
      if (DateTime.now().isBefore(expireTime)) {
        //  命中缓存
        return handler.resolve(
          Response(
            requestOptions: options,
            data: cacheData['data'],
            statusCode: 200,
          ),
        );
      } else {
        //  已过期，删除缓存
        storage.remove(key);
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final key = response.requestOptions.uri.toString();

    if (_shouldCache(key)) {
      final expireTime = DateTime.now().add(cacheDuration);
      final cacheData = {
        "data": response.data,
        "expireTime": expireTime.toIso8601String(),
      };
      storage.write(key, cacheData);
    }

    super.onResponse(response, handler);
  }
}
