part of '../listenable_object.dart';

class ImmutableListenable<T> extends Listenable<T> {
  ImmutableListenable(T obj) : super(obj);

  T get value => _value;
}
