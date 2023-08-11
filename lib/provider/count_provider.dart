import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  setcount() {
    _count++;
    notifyListeners();
  }

  Color _bgcolor = Colors.red;
  Color get bgcolor => _bgcolor;

  setbgcolor() {
    _bgcolor == Colors.red ? _bgcolor = Colors.purple : _bgcolor = Colors.red;
    notifyListeners();
  }
}
