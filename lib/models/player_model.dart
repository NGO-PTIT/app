class Player {
  final String name;
  final String position;
  final String jerseyNumber;
  final String avatarUrl;
  final String club;

  Player({
    required this.name,
    required this.position,
    required this.jerseyNumber,
    required this.avatarUrl,
    required this.club
  });
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        name: json['name'],
        position: json['position'],
        jerseyNumber: json['jerseyNumber'],
        avatarUrl: json['avatarUrl'],
        club: json['club']
    );
  }
}
