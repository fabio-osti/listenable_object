part of '../listenable_object.dart';

class MutableListenable<T> extends Listenable<T> {
  MutableListenable(T obj) : super(obj);

  T get value => _value;
  set value(T obj) {
    super._value = obj;
    super._sing();
  }
}