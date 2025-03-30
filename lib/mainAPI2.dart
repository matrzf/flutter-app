import 'package:flutter/material.dart';
import 'search_game_page.dart'; // ← à adapter selon ton arborescence

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recherche Steam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SearchGamePage(), // ← affiche la page de recherche
      debugShowCheckedModeBanner: false,
    );
  }
}