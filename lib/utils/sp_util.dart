import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

SpUtil spUtil = SpUtil();

class SpUtil {
  late SharedPreferences prefs;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setInt(String key, int value) async {
    return await prefs.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await prefs.setDouble(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await prefs.setStringList(key, value);
  }

  int? getInt(String key) {
    return prefs.getInt(key);
  }

  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  double? getDouble(String key) {
    return prefs.getDouble(key);
  }

  String getString(String key) {
    return prefs.getString(key)??"";
  }

  Future<bool> putString(String key,String val) {
    return prefs.setString(key,val);
  }

  List<String>? getStringList(String key) {
    return prefs.getStringList(key);
  }

  /// put object.

   Future<bool>? putObject(String key, Object value) {
    return prefs.setString(key, json.encode(value));
  }

  /// get obj.

   T? getObj<T>(String key, T f(Map v), {T? defValue}) {
    Map? map = getObject(key);
    return map == null ? defValue : f(map);
  }

  /// get object.

   Map? getObject(String key) {
    String? data = prefs.getString(key);
    return (data == null || data.isEmpty) ? null : json.decode(data);
  }

  /// put object list.

   Future<bool>? putObjectList(String key, List<Object> list) {
    List<String>? dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return prefs.setStringList(key, dataList);
  }




  Future<void> saveIntListData(String key,List<int> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(data); // 将 List<int> 转换为 JSON 字符串
    await prefs.setString(key, jsonString); // 存储到本地
  }


  // Future<List<int>?> getIntListData(String key) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonString = prefs.getString(key); // 获取存储的字符串
  //   if (jsonString != null) {
  //     List<dynamic> data = jsonDecode(jsonString); // 将 JSON 字符串解码为 List<dynamic>
  //     List<int> intList = List<int>.from(data); // 将 List<dynamic> 转换为 List<int>
  //     return intList;
  //   }
  //   return <int>[]; // 如果没有数据，返回 null
  // }

  Future<List<int>> getIntListData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key); // 获取存储的字符串
    if (jsonString != null) {
      List<dynamic> data = jsonDecode(jsonString); // 将 JSON 字符串解码为 List<dynamic>
      List<int> intList = data.map((item) => item as int).toList(); // 将 List<dynamic> 转换为 List<int>
      return intList;
    }
    return <int>[]; // 如果没有数据，返回 null
  }




}
