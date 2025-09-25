import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/favorites.dart';
import 'package:meals/screens/settings.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:provider/provider.dart';
import 'package:meals/providers/filters_provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => FiltersProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesScreen(),
      routes: {
        '/meals': (context) {
          final routeArgs =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          final categoryId = routeArgs['id']!;
          final categoryTitle = routeArgs['title']!;
          return MealsScreen(title: categoryTitle, id: categoryId);
        },
        '/meal-detail': (context) {
          final meal = ModalRoute.of(context)!.settings.arguments as Meal;
          return MealDetailScreen(meal: meal);
        },
        '/favorites': (context) => const FavoritesScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
