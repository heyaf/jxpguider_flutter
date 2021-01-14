import 'package:flutter/material.dart';

class HYFModelProvider extends ChangeNotifier {
  int _num;

  HYFModelProvider(this._num);

  get num => _num;
  set num(int count) {
    _num = count;
    notifyListeners();
  }
}
