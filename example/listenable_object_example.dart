import 'package:listenable_object/listenable_object.dart';

void main() {
  final listenable = ImmutableListenable(List<int>.empty(growable: true));
  final unlisten = listenable.listen((ref) => print(ref));
  listenable.update((reference) => reference.add(3));
  listenable.update((reference) => reference.add(4));
  listenable.update((reference) => reference.add(7));
  listenable.update((reference) => reference.add(12));
  unlisten();
  listenable.update((reference) => reference.add(144));
}
