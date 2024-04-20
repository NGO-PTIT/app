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
