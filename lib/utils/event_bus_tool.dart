

import 'package:event_bus/event_bus.dart';

class EventBusTools {
  static EventBus? _instance;

  static EventBus getInstance() {
    _instance ??=  EventBus();
    return _instance!;
  }
}

//路由变化通知
class  RouterChangeMessage{}


class RefreshMyTeamEvent {
  RefreshMyTeamEvent();
}


class RefreshMyScoreEvent {
  RefreshMyScoreEvent();
}


class MyTabEvent {
  MyTabEvent();
}


class LoginOutEvent {
  LoginOutEvent();
}
