import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favorite_places/providers/places_provider.dart';

class HomePlacesScreen extends StatefulWidget {
  const HomePlacesScreen({super.key});

  @override
  State<HomePlacesScreen> createState() => _HomePlacesScreenState();
}

class _HomePlacesScreenState extends State<HomePlacesScreen> {
  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlacesProvider>(context);
    final places = placesProvider.places;

    if (places.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('/add-place');
              },
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'No places added yet.',
            style: TextStyle(fontSize: 18, color: Colors.white54),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/add-place');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          final place = places[index];
          return Dismissible(
            key: ValueKey(place.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              placesProvider.removePlace(place.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${place.title} dismissed'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(place.title),
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamed('/place-detail', arguments: place);
              },
            ),
          );
        },
      ),
    );
  }
}
