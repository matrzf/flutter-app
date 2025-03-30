import 'package:flutter/material.dart';
import 'most_played_game.dart'; // adapte si ton fichier est dans un dossier

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steam Charts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MostPlayedGame(), // <- ici on lance la page de la liste
      debugShowCheckedModeBanner: false,
    );
  }
}
