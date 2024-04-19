class Club {
  final String name;
  final String image;
  final String stadium;
  final String history;
  final String target;
  final String logo;
  final String tournament;

  Club({
    required this.tournament,
    required this.name,
    required this.image,
    required this.stadium,
    required this.history,
    required this.target,
    required this.logo,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      image: json['image'],
      tournament: json['tournament'],
      name: json['name'],
      stadium: json['stadium'],
      history: json['history'],
      target: json['target'],
      logo: json['logo'],
    );
  }
}