import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './holders/appid_holder.dart';

class GameDetailPage extends StatefulWidget {
  const GameDetailPage({super.key});

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  Map<String, dynamic>? _gameData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchGameDetails();
  }

  Future<void> fetchGameDetails() async {
    final appid = AppIdHolder.selectedAppId;
    if (appid == null) {
      setState(() {
        _error = 'Aucun AppID sélectionné';
        _isLoading = false;
      });
      return;
    }

    final url = 'https://store.steampowered.com/api/appdetails?appids=$appid';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final appData = json['$appid'];
        if (appData['success'] == true) {
          setState(() {
            _gameData = appData['data'];
            _isLoading = false;
          });
        } else {
          setState(() {
            _error = 'Aucune donnée trouvée pour cet appid';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _error = 'Erreur API : ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Exception : $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail du jeu')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _gameData?['name'] ?? 'Nom inconnu',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(_gameData?['short_description'] ?? 'Pas de description'),
            const SizedBox(height: 20),
            if (_gameData?['header_image'] != null)
              Image.network(_gameData!['header_image']),
          ],
        ),
      ),
    );
  }
}
