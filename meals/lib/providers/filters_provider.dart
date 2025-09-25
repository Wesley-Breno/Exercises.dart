import 'package:flutter/material.dart';

class FiltersProvider with ChangeNotifier {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegetarian = false;
  bool vegan = false;

  void setGlutenFree(bool value) {
    glutenFree = value;
    notifyListeners();
  }

  void setLactoseFree(bool value) {
    lactoseFree = value;
    notifyListeners();
  }

  void setVegetarian(bool value) {
    vegetarian = value;
    notifyListeners();
  }

  void setVegan(bool value) {
    vegan = value;
    notifyListeners();
  }
}