
// app环境
import 'package:get/get.dart';
const AppEnvType appEnvType = AppEnvType.prod;
enum AppEnvType {
  dev,
  prod;

  List<String> get apiUrlList {
    switch (this) {
      case AppEnvType.dev:
        return [
          "https://api.dev.com/",
        ];
      case AppEnvType.prod:
        return [
          "https://api.prod.com/",

        ];
    }
  }


}


class DomainService extends GetxService {


  List<DomainItem> domainUrlList = [];

  String get currentDomain {

    if (domainUrlList.isNotEmpty) {
      final url = domainUrlList
          .firstWhereOrNull((element) => element.isValid)
          ?.domainUrl;
      if (url != null) {
        return url;
      }
    }
    return appEnvType.apiUrlList.first;
  }



  @override
  void onInit() {
    domainUrlList = appEnvType.apiUrlList
        .map((e) => DomainItem(
        domainUrl: e,
        isValid: true,
        updateTime: DateTime.now().millisecondsSinceEpoch))
        .toList();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

  }




}


extension CacheKey on String {
  String get cacheKey {
    return "cache_${this}_${appEnvType.toString()}";
  }
}

class DomainItem {
  final String domainUrl;
  final bool isValid;
  final int updateTime;

  DomainItem(
      {required this.domainUrl,
      required this.isValid,
      required this.updateTime});

  Map<String, dynamic> toJson() {
    return {
      "domainUrl": domainUrl,
      "isValid": isValid,
      "updateTime": updateTime
    };
  }

  factory DomainItem.fromJson(Map<String, dynamic> json) {
    return DomainItem(
        domainUrl: json["domainUrl"] ?? "",
        isValid: json["isValid"] ?? false,
        updateTime: json["updateTime"] ?? 0);
  }
}



