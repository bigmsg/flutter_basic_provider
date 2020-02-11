import 'package:flutter/material.dart';

class Counter with ChangeNotifier { // with: implement 의 선택적 구현가능함
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}