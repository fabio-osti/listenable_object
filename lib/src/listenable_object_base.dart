part of '../listenable_object.dart';

typedef Unlisten = Function();

abstract class Listenable<T> {
  Listenable(this._value);

  T _value;
  int _nextListenerKey = 0;
  final Map<int, Function(T)> _listeners = {};

  update(Function(T reference) fn) {
    fn(_value);
    _sing();
  }

  _sing() {
    _listeners.forEach((key, value) {
      value(_value);
    });
  }

  Unlisten listen(Function(T) listener) {
    var listenerKey = _nextListenerKey;
    while(_listeners.containsKey(listenerKey)) {
      listenerKey = _nextListenerKey++;
    }
    
    _listeners[listenerKey] = listener;
    return () {
      _listeners.remove(listenerKey);
    };
  }
}
