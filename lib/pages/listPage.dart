import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientCard(
                gColor1: Colors.purple,
                gColor2: Colors.pinkAccent,
              ),
              GradientCard(gColor1: Colors.deepOrange, gColor2: Colors.orange),
              GradientCard(gColor1: Colors.deepOrange, gColor2: Colors.orange),
              GradientCard(
                gColor1: Colors.blue,
                gColor2: Colors.pinkAccent,
              ),
              GradientCard(
                gColor1: Colors.purple,
                gColor2: Colors.pinkAccent,
              ),
              GradientCard(
                gColor1: Colors.purple,
                gColor2: Colors.pinkAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCard extends StatelessWidget {
  final Color gColor1;
  final Color gColor2;

  const GradientCard({
    Key key,
    this.gColor1,
    this.gColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [gColor1, gColor2])),
      child: Card(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: Svg('assets/bakery.svg'),
                radius: 25,
              ),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
