import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.star_border, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildFeaturedGame(),
            SizedBox(height: 20),
            Text('Les meilleures ventes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildBestSellersList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher un jeu...',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        suffixIcon: Icon(Icons.search, color: Color(0xFF636AF6)),
        filled: true,
        fillColor: Colors.black54,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildFeaturedGame() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Titan Fall 2 Ultimate Edition', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 5),
                Text('Une description d\'un jeu mis en avant (peut être fait en dur).', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                SizedBox(
                  height: 40, // hauteur pour le bouton
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF636AF6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20), // largeur
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Arrondir les bords
                      ),
                    ),
                    child: const Text("En savoir plus", style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 80,
            height: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildBestSellersList(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => _buildGameCard(context)),
    );
  }

  Widget _buildGameCard(BuildContext context) {
    return Card(
      color: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom du jeu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('Nom de l\'éditeur', style: TextStyle(color: Colors.grey)),
                  Text('Prix : 10,00 €', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 70, // hauteur pour le bouton
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push('/game');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF636AF6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40), // largeur
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Arrondir les bords
                  ),
                ),
                child: const Text("En savoir plus", style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}