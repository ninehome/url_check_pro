import 'dart:async';

import 'package:flutter/foundation.dart';

class ThrottleUtils {
  int milliseconds ;
  bool _enable = true;

  ThrottleUtils({this.milliseconds =1200});

  run(VoidCallback action) {
    if (_enable) {
      _enable = false;
      action();
      Timer(Duration(milliseconds: milliseconds), () {
        _enable = true;
      });
    }
  }
}
