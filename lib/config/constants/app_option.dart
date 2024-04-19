import 'package:football_news_app/models/club_model.dart';
import 'package:football_news_app/models/new_model.dart';
import 'package:football_news_app/views/page/schedule/schedule_page.dart';

import '../../models/comment_model.dart';
import '../../models/player_model.dart';
import '../../models/schedule_model.dart';
import '../../models/score_model.dart';
import '../../models/statistical_model.dart';
import '../../models/user_model.dart';
import 'assets.dart';

class AppOption {
  
  static List<Schedule> footballSchedules = [
    Schedule(
        team1: 'Liverpool',
        icon1: Assets.icon1,
        team2: 'Man United',
        icon2: Assets.icon9,
        time: '21:00',
        date: '10/04'),
    Schedule(
        team1: 'Chelsea',
        icon1: 'assets/icons/chelsea.png',
        team2: 'Arsenal',
        icon2: 'assets/icons/arsenal.png',
        time: '19:00',
        date: '11/04'),
    Schedule(
        team1: 'Man City',
        icon1: 'assets/icons/mc.png',
        team2: 'Tottenham',
        icon2: 'assets/icons/tot.png',
        time: '21:00',
        date: '12/04'),
    Schedule(
        team1: 'Everton',
        icon1: 'assets/icons/everton.png',
        team2: 'Leicester City',
        icon2: 'assets/icons/lester.png',
        time: '18:00',
        date: '13/04'),
    Schedule(
        team1: 'Wolves',
        icon1: 'assets/icons/wolves.png',
        team2: 'Newcastle',
        icon2: 'assets/icons/newcs.png',
        time: '20:00',
        date: '14/04'),
    Schedule(
        team1: 'Spur',
        icon1: 'assets/icons/tot.png',
        team2: 'Crystal Palace',
        icon2: 'assets/icons/crystal_palace.png',
        time: '16:00',
        date: '13/04'),
    Schedule(
        team1: 'West Ham',
        icon1: 'assets/icons/west_ham.png',
        team2: 'Aston Villa',
        icon2: 'assets/icons/aston_villa.png',
        time: '18:30',
        date: '15/04'),
    Schedule(
        team1: 'Leeds United',
        icon1: 'assets/icons/leed.png',
        team2: 'Norwich City',
        icon2: 'assets/icons/nor.png',
        time: '17:00',
        date: '15/04'),
    Schedule(
        team1: 'Watford',
        icon1: 'assets/icons/watford.png',
        team2: 'Brighton',
        icon2: 'assets/icons/brighton.png',
        time: '19:45',
        date: '18/04'),
    Schedule(
        team1: 'PSG',
        icon1: 'assets/icons/psg.png',
        team2: 'FC Barelona',
        icon2: 'assets/icons/barcelona.png',
        time: '2-3',
        date: 'FT'),
    Schedule(
        team1: 'Real Madrid',
        icon1: 'assets/icons/real_madrid.png',
        team2: 'Man City',
        icon2: 'assets/icons/mc.png',
        time: '3-3',
        date: 'FT'),
    Schedule(
        team1: 'Arsenal',
        icon1: 'assets/icons/arsenal.png',
        team2: 'FC Bayern',
        icon2: 'assets/icons/bayern.png',
        time: '2-2',
        date: 'FT'),
    Schedule(
        team1: 'Atletico Madrid',
        icon1: 'assets/icons/atletico.png',
        team2: 'Dortmund',
        icon2: 'assets/icons/dortmund.png',
        time: '2-1',
        date: 'FT'),
  ];
  static List<Comment> comments = [
    Comment(
      userName: 'Nguyễn Văn A',
      text: 'Bình luận 1',
      image: Assets.imgNews2,
    ),
    Comment(
      userName: 'Nguyễn Văn B',
      text: 'Bình luận 2',
      image: Assets.imgNews2,
    ),
    Comment(
      userName: 'Nguyễn Văn C',
      text: 'Bình luận 3',
      image: Assets.imgNews2,
    ),
  ];
  static final List<User> user = [
    User(id: 1, email: 'email', password: 'password')
  ];

  static final MatchStats team1Stats = MatchStats(
    shots: 18,
    shotsOnTarget: 6,
    possession: '59%',
    passes: 567,
    passAccuracy: '88%',
    fouls: 14,
    yellowCards: 2,
    redCards: 0,
    offsides: 4,
    corners: 7,
  );

  static final MatchStats team2Stats = MatchStats(
    shots: 15,
    shotsOnTarget: 7,
    possession: '41%',
    passes: 395,
    passAccuracy: '84%',
    fouls: 8,
    yellowCards: 4,
    redCards: 0,
    offsides: 3,
    corners: 5,
  );
}
