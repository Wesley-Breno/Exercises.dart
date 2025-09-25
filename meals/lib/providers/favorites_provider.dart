import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<String> _favoriteIds = [];

  List<String> get favoriteIds => _favoriteIds;

  void toggleFavorite(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }

  bool isFavorite(String id) => _favoriteIds.contains(id);
}