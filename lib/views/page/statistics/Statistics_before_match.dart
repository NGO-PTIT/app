import 'package:flutter/material.dart';

class MatchInfo extends StatelessWidget {
  const MatchInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network('path_to_barcelona_logo'),
              title: Text('Barcelona vs PSG'),
              subtitle: Text('Quarter-final - Leg 2 of 2\nAggregate: 3 - 2'),
              trailing: Image.network('path_to_psg_logo'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  WinProbability(
                    team: 'Barcelona',
                    probability: 44,
                    color: Colors.blueAccent,
                  ),
                  WinProbability(
                    team: 'Extra time',
                    probability: 25,
                    color: Colors.grey,
                  ),
                  WinProbability(
                    team: 'PSG',
                    probability: 31,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WinProbability extends StatelessWidget {
  final String team;
  final int probability;
  final Color color;

  WinProbability({super.key,
    required this.team,
    required this.probability,
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('$team'),
        SizedBox(height: 4.0),
        Text('$probability%', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4.0),
        LinearProgressIndicator(
          value: probability / 100,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          backgroundColor: Colors.grey[300],
        ),
      ],
    );
  }
}
