import 'package:flutter/material.dart';

class PlacesProvider with ChangeNotifier {
  final List<Map<String, String>> _places = [];

  List<Map<String, String>> get places => List.unmodifiable(_places);

  void addPlace(Map<String, String> place) {
    _places.add(place);
    notifyListeners();
  }

  void removePlace(Map<String, String> place) {
    _places.remove(place);
    notifyListeners();
  }
}