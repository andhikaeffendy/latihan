import 'package:flutter/material.dart';

class TimeState with ChangeNotifier {
  int _time = 15;

  int get time => _time;

  set time(int time) {
    _time = time;
    notifyListeners();
  }
}
