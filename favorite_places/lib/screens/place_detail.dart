import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(place['title']!),
      ),
      body: Center(
        child: Text(
          'Details of the selected place',
          style: TextStyle(fontSize: 18, color: Colors.white54),
        ),
      ),
    );
  }
}
