class MatchStats {
  int shots;
  int shotsOnTarget;
  String possession;
  int passes;
  String passAccuracy;
  int fouls;
  int yellowCards;
  int redCards;
  int offsides;
  int corners;

  MatchStats({
    required this.shots,
    required this.shotsOnTarget,
    required this.possession,
    required this.passes,
    required this.passAccuracy,
    required this.fouls,
    required this.yellowCards,
    required this.redCards,
    required this.offsides,
    required this.corners,
  });
}