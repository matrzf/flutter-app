import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './holders/appid_holder.dart';
import 'game_detail_page.dart';

class SearchGamePage extends StatefulWidget {
  const SearchGamePage({super.key});

  @override
  State<SearchGamePage> createState() => _SearchGamePageState();
}

class _SearchGamePageState extends State<SearchGamePage> {
  List<dynamic> _results = [];
  bool _isLoading = false;
  String _searchQuery = '';

  Future<void> searchGames(String query) async {
    setState(() {
      _isLoading = true;
    });

    final url = 'https://steamcommunity.com/actions/SearchApps/$query';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _results = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _results = [];
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _results = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recherche Steam')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nom du jeu',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _searchQuery = value;
              },
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  searchGames(value.trim());
                }
              },
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final game = _results[index];
                  return ListTile(
                    title: Text(game['name'] ?? 'Nom inconnu'),
                    subtitle: Text('AppID: ${game['appid']}'),
                    onTap: () {
                      AppIdHolder.selectedAppId = int.tryParse(game['appid'].toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GameDetailPage(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
