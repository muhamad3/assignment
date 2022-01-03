import 'package:flutter/material.dart';

class Counterprovider extends ChangeNotifier {
  int _counter = 0;
  get counter => _counter;

  void increment() {
    _counter += 1;
    notifyListeners();
  }

  void decrement() {
    _counter -= 1;
    notifyListeners();
  }

   void reset() {
    _counter = 0;
    notifyListeners();
  }
}
