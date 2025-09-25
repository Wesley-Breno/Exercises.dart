import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    late final favoritesProvider = Provider.of<FavoritesProvider>(context);
    late final favoriteMeals = dummyMeals
        .where((meal) => favoritesProvider.isFavorite(meal.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) => MealItem(meal: favoriteMeals[index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            activeIcon: Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            activeIcon: Icon(Icons.favorite_outline),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/favorites');
          }
        },
      ),
    );
  }
}
