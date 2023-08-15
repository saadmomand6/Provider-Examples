import 'package:flutter/material.dart';

class Favouriteitem with ChangeNotifier {
  final List<int> _selecteditems = [];
  List<int> get selecteditem => _selecteditems;

  void additem(int value) {
    _selecteditems.add(value);
    notifyListeners();
  }

  void removeitemformyfavouritesscreen(int value) {
    _selecteditems.removeAt(value);
    notifyListeners();
  }

//only to remove item from favorite screen also
  void removeitemforfavouritescreen(int value) {
    _selecteditems.remove(value);
    notifyListeners();
  }
}
