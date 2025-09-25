import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meals/providers/filters_provider.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final filters = Provider.of<FiltersProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Gluten-free'),
              value: filters.glutenFree,
              onChanged: (bool value) {
                setState(() {
                  filters.setGlutenFree(value);
                });
              },
            ),
            SwitchListTile(
              title: Text('Lactose-free'),
              value: filters.lactoseFree,
              onChanged: (bool value) {
                setState(() {
                  filters.setLactoseFree(value);
                });
              },
            ),
            SwitchListTile(
              title: Text('Only vegetarian meals'),
              value: filters.vegetarian,
              onChanged: (bool value) {
                setState(() {
                  filters.setVegetarian(value);
                });
              },
            ),
            SwitchListTile(
              title: Text('Only vegan meals'),
              value: filters.vegan,
              onChanged: (bool value) {
                setState(() {
                  filters.setVegan(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}