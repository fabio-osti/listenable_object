import 'package:listenable_object/listenable_object.dart';
import 'package:test/test.dart';

void main() {
  group('Immutable', () {
    final immutListenable = ImmutableListenable(Person('Ana', 'Maiden', 0));
    var curValue = immutListenable.value;
    final unlisten = immutListenable.listen((person) {
      curValue = Person.from(person);
    });

    test('Update more than one member', () {
      immutListenable.update((reference) {
        reference.status = 'Married';
        reference.childrenCount++;
      });

      expect(curValue.status, 'Married');
      expect(curValue.childrenCount, 1);
    });

    test('Update a single member', () {
      immutListenable.update((reference) => reference.childrenCount++);
      expect(curValue.childrenCount, 2);
    });

    test('Unlisten', () {
      unlisten();
      immutListenable.update((reference) => reference.childrenCount++);
      expect(curValue.childrenCount, 2);
    });
  });
}

class Person {
  Person(this.name, this.status, this.childrenCount);
  Person.from(Person p)
      : name = p.name,
        status = p.status,
        childrenCount = p.childrenCount;
        
  final String name;
  String status;
  int childrenCount;
}
