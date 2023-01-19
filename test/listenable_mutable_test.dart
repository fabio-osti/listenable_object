import 'package:listenable_object/listenable_object.dart';
import 'package:test/test.dart';

void main() {
  group('Mutable', () {
    final mutListenable = MutableListenable(12);
    var curValue = mutListenable.value;
    final unlisten = mutListenable.listen((e) => curValue = e);

    setUp(() {
      // Additional setup goes here.
    });

    test('Set value', () {
      mutListenable.value *= 12;
      expect(curValue, 144);
    });

    test('Unlisten', () {
      unlisten();
      mutListenable.value -= 132;
      expect(curValue, 144);
    });
  });
}
