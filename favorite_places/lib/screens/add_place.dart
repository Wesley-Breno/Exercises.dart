import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favorite_places/providers/places_provider.dart';

class AddPlace extends StatefulWidget {
  AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _formKey = GlobalKey<FormState>();
  final _id = DateTime.now().toString();
  var _title = '';
  final Map<String, String> _place = {};

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    _formKey.currentState?.save();
    _place['title'] = _title;
    _place['id'] = _id;
    Provider.of<PlacesProvider>(
      context,
      listen: false,
    ).addPlace(_place);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a New Place')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white54),
                  decoration: InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _saveForm();
                  },
                  child: Text('Add Place'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
