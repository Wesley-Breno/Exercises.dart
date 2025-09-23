import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(filteredMeals[index].title));
        },
      ),
    );
  }
}
