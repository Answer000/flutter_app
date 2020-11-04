
/// 订阅者回调签名
typedef void EventCallback(arg);

var eventManager = EventManager();

enum EventName {
  login
}

class EventManager {
  // 私有函数
  EventManager._internal();

  // 保存单例
  static EventManager _singleton = new EventManager._internal();

  // 工厂构造函数
  factory EventManager() => _singleton;

  // 保存事件订阅者队列，key:事件名（id）, value: 对应事件的订阅者队列
  Map _eventMap = new Map<Object, List<EventCallback>>();

  // 添加订阅者
  void add(EventName eventName, EventCallback task) {
    if(eventName.toString() == null || task == null) { return; }
    _eventMap[eventName.toString()] ??= new List<EventCallback>();
    _eventMap[eventName.toString()].add(task);
  }

  // 移除订阅者
  void remove(EventName eventName, [EventCallback task]) {
    var list = _eventMap[eventName.toString()];
    if(eventName.toString() == null || list == null) { return; }
    if(task == null) {
      _eventMap[eventName.toString()] = null;
    }else{
      list.remove(task);
    }
  }

  // 触发事件，事件触发后该事件所有订阅者都会被调用
  void emit(EventName eventName, [arg]) {
    var list = _eventMap[eventName.toString()];
    if(list == null) return;
    int len = list.length - 1;
    // 方向遍历，防止订阅者再回调中移除自身带来的下标错位
    for(var i=len; i>-1; i--){
      list[i](arg);
    }
  }
}