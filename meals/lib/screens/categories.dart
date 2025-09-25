import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category')),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: const Text('Meals Recipes App'),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Categories'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/favorites');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
          ],
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            activeIcon: Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites', activeIcon: Icon(Icons.favorite_outline)),
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
