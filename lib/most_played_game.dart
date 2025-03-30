import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './holders/appid_holder.dart';
import 'game_detail_page.dart';

class MostPlayedGame extends StatefulWidget {
  const MostPlayedGame({super.key});

  @override
  State<MostPlayedGame> createState() => _MostPlayedGameState();
}

class _MostPlayedGameState extends State<MostPlayedGame> {
  List<dynamic> _games = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchMostPlayedGames();
  }

  Future<void> fetchMostPlayedGames() async {
    const url = 'https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> games = json['response']['ranks'];
        setState(() {
          _games = games;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Erreur : ${response.statusCode}';
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
      appBar: AppBar(title: const Text('Top jeux Steam')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : ListView.builder(
        itemCount: _games.length,
        itemBuilder: (context, index) {
          final game = _games[index];
          return ListTile(
            leading: Text('#${game['rank']}'),
            title: Text('AppID: ${game['appid'] ?? 0}'),
            subtitle: Text('${game['peak_in_game'] ?? 0} joueurs en pic'),
            onTap: () {
              final appid = game['appid'];
              if (appid != null) {
                AppIdHolder.selectedAppId = appid;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameDetailPage(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
