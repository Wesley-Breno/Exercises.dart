import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color colorValue;

  Category(this.name, this.colorValue);
}

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other;
}
