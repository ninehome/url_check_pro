
class SrNetWorkConfig{

  static int developType = 1;  // 0 为本地环境， 1为测试环境， 2为发布环境

  static  String devBaseUrl = 'http://43.199.136.144:8001/'; //开发环境
  static  String testBaseUrl = 'https://api.dfh-dev.top/'; //测试环境
  static  String release = ''; //  发布环境

  static String webTestUrl = ''; // H5 开发环境
  static String webLocalUrl = ''; // H5 测试环境
  static String webReleaseUrl = ''; // H5 发布环境


  //选择环境
  static String getBaseUrl() {
    switch (developType) {
      case 0 :  // 本地
        return devBaseUrl;
      case 1:  // 测试
        return testBaseUrl;
      case 2: // 发布
        return release;
      default:
        return devBaseUrl;
    }
  }

  String webUrl() {
    switch (developType) {
      case 0 :
        return webLocalUrl;
      case 1:
        return webTestUrl;
      case 2:
        return webReleaseUrl;
      default:
        return webTestUrl;
    }
  }
}
