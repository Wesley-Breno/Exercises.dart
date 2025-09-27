import 'package:flutter/material.dart';
import 'package:favorite_places/models/place..dart';

class PlacesProvider with ChangeNotifier {
  final List<Place> _places = [];

  List<Place> get places => List.unmodifiable(_places);

  void addPlace(Place place) {
    _places.add(place);
    notifyListeners();
  }

  void removePlace(String id) {
    _places.removeWhere((place) => place.id == id);
    notifyListeners();
  }
}
