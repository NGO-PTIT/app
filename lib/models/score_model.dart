class ScoreModel {
  final int position;
  final String teamName;
  final int matchesPlayed;
  final int wins;
  final int draws;
  final int losses;
  final int goalsFor;
  final int goalsAgainst;
  final String avatarUrl;

  ScoreModel({
    required this.position,
    required this.teamName,
    required this.matchesPlayed,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.avatarUrl,
  });
}
