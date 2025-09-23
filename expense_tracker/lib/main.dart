import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 117, 63, 245),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 34, 3, 92),
);

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //  fn,
  //) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        // dark() no longer takes any arguments
        colorScheme: kColorScheme,
        cardTheme: CardThemeData(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.all(12),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData(
          color: kColorScheme.primaryContainer,
          margin: EdgeInsets.all(12),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kColorScheme.onSecondaryContainer,
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
  //});
}
