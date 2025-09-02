
import 'package:untitled2/server/server_url.dart';

import '../http/sr_rx_http.dart';


class ServerApi {
  static Future<KDRxResponse> fetchUploadToken(Map<String, dynamic> jsonMap) async {
    var res = await KDRxHttp.post(
      ServerUrl.getUploadToken,
      params: jsonMap,
      showHud: false,
    );
    return res;
  }




}