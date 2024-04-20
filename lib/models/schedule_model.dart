class Schedule{
  final String team1;
  final String icon1;
  final String team2;
  final String icon2;
  final String time;
  final String date;
  final String infor;
  final String tournament;

  Schedule({
    required this.team1,
    required this.icon1,
    required this.team2,
    required this.icon2,
    required this.time,
    required this.date,
    required this.infor,
    required this.tournament
  });
  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      tournament: json['tournament'],
      team1: json['team1'],
      icon1: json['icon1'],
      team2: json['team2'],
      icon2: json['icon2'],
      time: json['time'],
      date: json['date'],
      infor: json['infor'],
    );
  }
}
