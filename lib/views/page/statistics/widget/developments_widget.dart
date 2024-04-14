import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/schedule_model.dart';

class DevelopmentPage extends StatefulWidget {
  final Schedule schedule;

  DevelopmentPage({super.key, required this.schedule});

  @override
  State<DevelopmentPage> createState() => DevelopmentPageState();
}

class DevelopmentPageState extends State<DevelopmentPage> {
  late final Schedule schedule;

  @override
  void initState() {
    super.initState();
    schedule = widget.schedule;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        schedule.team1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        schedule.time[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Divider(color: Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        schedule.team2,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        schedule.time[2],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: EventTimeline()),
        ],
      ),
    );
  }
}

class EventTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'minute': '1',
      'team': 'Man City',
      'player': 'Aurelien Tchouameni',
      'isGoal': false,
    },
    {
      'minute': '12',
      'team': 'Man City',
      'player': 'Ruben Dias',
      'isGoal': true,
    },
    {
      'minute': '42',
      'team': 'Real Madrid',
      'player': 'Benzema',
      'isGoal': true,
    },
    {
      'minute': '75',
      'team': 'Man City',
      'player': 'Ruben Dias',
      'isGoal': true,
    },
    {
      'minute': '60',
      'team': 'Real Madrid',
      'player': 'S.Ramos',
      'isGoal': false,
    },
    {
      'minute': '65',
      'team': 'Real Madrid',
      'player': 'S.Ramos',
      'isGoal': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          leading: event['isGoal']
              ? Icon(Icons.sports_soccer, color: Colors.black)
              : Icon(Icons.warning, color: Colors.yellow[700]),
          title: Text(
            '${event['player']}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('${event['team']}'),
          trailing: Text('${event['minute']}\''),
        );
      },
    );
  }
}
