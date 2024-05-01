import 'dart:ffi';

class MatchStats {
  int id;
  int shots1;
  int shots2;
  int shotsOnTarget1;
  int shotsOnTarget2;
  int possession1;
  int possession2;
  int passes1;
  int passes2;
  String passAccuracy1;
  String passAccuracy2;
  int fouls1;
  int fouls2;
  int yellowCards1;
  int yellowCards2;
  int redCards1;
  int redCards2;
  int offsides1;
  int offsides2;
  int corners1;
  int corners2;

  MatchStats({
    required this.id,
    required this.shots1,
    required this.shots2,
    required this.shotsOnTarget1,
    required this.shotsOnTarget2,
    required this.possession1,
    required this.possession2,
    required this.passes1,
    required this.passes2,
    required this.passAccuracy1,
    required this.passAccuracy2,
    required this.fouls1,
    required this.fouls2,
    required this.yellowCards1,
    required this.yellowCards2,
    required this.redCards1,
    required this.redCards2,
    required this.offsides1,
    required this.offsides2,
    required this.corners1,
    required this.corners2,
  });

  factory MatchStats.fromJson(Map<String, dynamic> json) {
    return MatchStats(
      id: json['id'],
      shots1: json['shots1'],
      shots2: json['shots2'],
      shotsOnTarget1: json['shots_on_target1'],
      shotsOnTarget2: json['shots_on_target2'],
      possession1: json['possession1'],
      possession2: json['possession2'],
      passes1: json['passes1'],
      passes2: json['passes2'],
      passAccuracy1: json['pass_accuracy1'],
      passAccuracy2: json['pass_accuracy2'],
      fouls1: json['fouls1'],
      fouls2: json['fouls2'],
      yellowCards1: json['yellow_cards1'],
      yellowCards2: json['yellow_cards2'],
      redCards1: json['red_cards1'],
      redCards2: json['red_cards2'],
      offsides1: json['offsides1'],
      offsides2: json['offsides2'],
      corners1: json['corners1'],
      corners2: json['corners2'],
    );
  }
}