class Score {
  final String tournament;
  final int position;
  final String teamName;
  final int matchesPlayed;
  final int wins;
  final int draws;
  final int losses;
  final int goalsFor;
  final int goalsAgainst;
  final int point;
  final String avatarUrl;

  Score({
    required this.tournament,
    required this.position,
    required this.teamName,
    required this.matchesPlayed,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.point,
    required this.avatarUrl,
  });
  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
        tournament: json['tournament'],
        position: json['position'],
        teamName: json['teamName'],
        matchesPlayed: json['matchesPlayed'],
        wins: json['wins'],
        draws: json['draws'],
        losses: json['losses'],
        goalsFor: json['goalsFor'],
        goalsAgainst: json['goalsAgainst'],
        point: json['points'],
        avatarUrl: json['avatarUrl']
    );
  }
}
