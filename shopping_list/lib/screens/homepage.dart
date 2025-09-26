import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (context) => const NewItemScreen()),
    );

    if (newItem == null) {
      return;
    }
    
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: _addItem)],
      ),
      body: ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          final item = _groceryItems[index];
          return Row(
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
          );
        },
      ),
    );
  }
}
