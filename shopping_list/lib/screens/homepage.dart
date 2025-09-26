import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Groceries')),
      body: Column(
        children: [
          for (var item in groceryItems)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.square, color: item.category.colorValue),
                ),
                Text(item.name),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(item.quantity.toString()),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
