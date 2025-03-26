import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  bool _isDescriptionActive = true;

  final List<Map<String, dynamic>> _reviews = [
    {
      'username': 'Utilisateur 1',
      'rating': 5,
      'comment': 'Bacon ipsum dolor amet rump donner brisket corned beef tri-tip. '
      'Burgdoggen t-bone leberkas, tri-tip bacon beef ribs corned beef meatball '
      'andouille fatback alcatra strip steak turkey kevin.'
    },
    {
      'username': 'Utilisateur 2',
      'rating': 4,
      'comment': 'Chislic porchetta boudin swine filet mignon tongue t-bone '
      'pancetta cupim buffalo chicken ribeye landjaeger.'
    },
    {
      'username': 'Utilisateur 3',
      'rating': 5,
      'comment': 'Sausage salami tongue, burgdoggen hamburger pork chop fatback '
      'tri-tip t-bone meatloaf alcatra.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      appBar: AppBar(
        title: Text('Details du jeu'),
        centerTitle: false,
        backgroundColor: Color(0xFF1A2025),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: SvgPicture.asset(
                'res/svg/like.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: SvgPicture.asset(
                'res/svg/whishlist.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Image placeholder
          Container(
          height: 250,
          color: Colors.red,
        ),

        // Card Section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Placeholder for game cover
                Container(
                  width: 80,
                  height: 100,
                  color: Colors.red,
                ),
                const SizedBox(width: 16),
                // Game Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                  Text(
                    'Battlefield',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                      'Electronic Arts',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
            ],
          ),
        ),
      ),

      // Tabs Section
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isDescriptionActive = true;
                });
              },
              child: Container(
                color: _isDescriptionActive ? Colors.deepPurple : Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'DESCRIPTION',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: _isDescriptionActive ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isDescriptionActive = false;
                });
              },
              child: Container(
                color: !_isDescriptionActive ? Colors.deepPurple : Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'AVIS',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: !_isDescriptionActive ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      _isDescriptionActive
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Bacon ipsum dolor amet rump donner brisket corned beef tri-tip. '
              'Burgdoggen t-bone leberkas, tri-tip bacon beef ribs corned '
              'beef meatball andouille fatback alcatra strip steak turkey kevin. '
              'Short loin andouille cupim boudin, hamburger burgdoggen fatback. '
              'Chislic porchetta boudin swine filet mignon tongue t-bone pancetta '
              'cupim buffalo chicken ribeye landjaeger.',
          style: TextStyle(color: Colors.white70),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: _reviews.map((review) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review['username'],
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: List.generate(
                          5,
                              (index) => Icon(
                            index < review['rating'] ? Icons.star : Icons.star_border,
                            color: Colors.yellow,
                            size: 20,
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  review['comment'],
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          )).toList(),
        ),
      ),
      ],
    ),
    ),
    );
  }
}