<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Listenable wrapper.

## Features

Notifies all listener of udpates to objects.

## Getting started

Install and start using.

## Usage

```dart
  final listenable = ImmutableListenable([List<int>.empty(growable: true)]);
  final unlisten = listenable.listen((ref) => print(ref));
  listenable.update((reference) => reference.add(3));
  listenable.update((reference) => reference.add(4));
  listenable.update((reference) => reference.add(7));
  listenable.update((reference) => reference.add(12));
  unlisten();
```
