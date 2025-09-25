import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:meals/providers/filters_provider.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(id))
        .toList();

    final filters = Provider.of<FiltersProvider>(context);
    if (filters.glutenFree) {
      filteredMeals.removeWhere((meal) => !meal.isGlutenFree);
    }
    if (filters.lactoseFree) {
      filteredMeals.removeWhere((meal) => !meal.isLactoseFree);
    }
    if (filters.vegetarian) {
      filteredMeals.removeWhere((meal) => !meal.isVegetarian);
    }
    if (filters.vegan) {
      filteredMeals.removeWhere((meal) => !meal.isVegan);
    }

    if (filteredMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: const Center(
          child: Text('No meals found!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(151, 131, 57, 0))),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (ctx, index) => MealItem(meal: filteredMeals[index]),
      ),
    );
  }
}
