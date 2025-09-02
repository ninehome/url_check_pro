typedef ModelBuild<T> = T Function(Map<String, dynamic> json);

class SrResponse<T> {
  /// 请求是否成功
  bool isSuccess = false;
  int code = 200;

  /// 后台返回信息
  String msg = '';

  /// 后台返回数据 不包含message/
  dynamic data;

  /// 模型
  List<T>? list;
  T? model;

  SrResponse(this.data);

  modelBuild({ModelBuild<T>? modelBuilder, required dynamic json}) {
    SrResponse<T> response = this;

    /// 空则返回
    if (modelBuilder == null) {
      return this;
    }

    /// 模型转换
    if (json is Map<String, dynamic>) {
      response.model = modelBuilder(json);
    }

    /// 数组转换
    if (json is List<Map<String, dynamic>>) {
      response.list = json.map((e) => modelBuilder(e)).toList();
    }

    return response;
  }
}
