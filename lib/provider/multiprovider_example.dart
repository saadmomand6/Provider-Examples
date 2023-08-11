import 'package:flutter/material.dart';

class MultipleProviderExample with ChangeNotifier {
  double _val = 1.0;
  double get val => _val;

  void setvalue(double sliderval) {
    _val = sliderval;
    notifyListeners();
  }
}
