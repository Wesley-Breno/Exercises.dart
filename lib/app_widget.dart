import 'package:flutter/material.dart';
import 'package:tinder_challenge/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: "/",
      routes: {"/": (context) => LoginPage()},
    );
  }
}
