import 'package:football_news_app/models/club_model.dart';
import 'package:football_news_app/models/new_model.dart';
import 'package:football_news_app/views/page/schedule/schedule_page.dart';

import '../../models/comment_model.dart';
import '../../models/player_model.dart';
import '../../models/schedule_model.dart';
import '../../models/score_model.dart';
import '../../models/statistical_model.dart';
import 'assets.dart';

class AppOption {
  static List<Club> listClub = [
    Club(
      name : 'Manchester United',
      logo: 'assets/images/manchester_united.png',
      image: 'assets/images/mu.jpg',
      stadium: 'Old Trafford',
      history: 'Câu lạc bộ bóng đá Manchester United (tiếng Anh: Manchester '
      'United Football Club, hay ngắn gọn là MU hay Man Utd) là một câu '
      'lạc bộ bóng đá chuyên nghiệp có trụ sở tại Old Trafford, Manchester, Anh. '
      'Câu lạc bộ hiện đang chơi tại Giải bóng đá Ngoại hạng Anh, giải đấu '
      'hàng đầu trong hệ thống bóng đá Anh.' + '\n'+'Với biệt danh Quỷ Đỏ, '
      'câu lạc bộ được thành lập dưới tên Newton Heath LYR Football Club '
      'vào năm 1878, đổi tên thành Manchester United vào năm 1902 và '
      'chuyển đến sân vận động hiện tại, Old Trafford, vào năm 1910.',
      target: 'Mục tiêu của Manchester United là giành danh hiệu, phát triển '
      'tài năng trẻ, xây dựng đội bóng mạnh mẽ, tạo niềm vui cho người hâm '
      'mộ và kinh doanh thành công.',
      players: [],
    ),
    Club(
      name: 'Liverpool',
      logo: 'assets/images/liverpool.png',
      image: 'assets/images/liverpool.jpg',
      stadium: 'Anfield',
      history: 'Câu lạc bộ bóng đá Liverpool (tiếng Anh: Liverpool Football '
      'Club) là một câu lạc bộ bóng đá chuyên nghiệp có trụ sở tại '
      'Liverpool, Anh, hiện đang thi đấu ở Premier League, giải đấu '
      'hàng đầu của hệ thống bóng đá Anh. Ở trong nước, câu lạc bộ '
      'đã giành được 19 chức vô địch Ngoại hạng Anh, 8 FA Cup, kỷ lục '
      '10 League Cup và 16 FA Community Shield.'+'\n' +'Trong các giải đấu quốc '
          'tế, câu lạc bộ đã giành được sáu Cúp C1 Châu Âu, nhiều hơn bất '
      'kỳ một câu lạc bộ Anh nào khác, ba Cúp UEFA, bốn Siêu cúp UEFA '
      'và một FIFA Club World Cup.',
      target: 'Mục tiêu của Liverpool là trở thành một trong những đội bóng '
      'hàng đầu thế giới, giành được danh hiệu Premier League và Champions '
      'League, xây dựng đội hình mạnh mẽ, phát triển tài năng trẻ và '
      'mang đến niềm vui và sự tự hào cho người hâm mộ trên toàn cầu.',
      players: ['Alisson Becker', 'Virgil van Dijk', 'Mohamed Salah'],
    ),
    Club(
      name: 'Barcelona',
      logo: 'assets/images/barcelona.png',
      image: 'assets/images/fcb.jpg',
      stadium: 'Camp Nou',
      history: 'FC Barcelona là một câu lạc bộ bóng đá nổi tiếng có trụ sở '
      'tại Barcelona, Tây Ban Nha. Được thành lập vào năm 1899, '
      'Barcelona đã trở thành một biểu tượng văn hóa và thể thao quan '
      'trọng của thành phố này. Trong lịch sử của mình, Barcelona đã '
      'giành được nhiều danh hiệu đáng chú ý.'+'\n'+'Clb này đã giành chức '
      'vô địch La Liga, giải đấu cao nhất của Tây Ban Nha, nhiều lần. '
      'Đặc biệt, Barcelona đã trở thành một trong những đội bóng nổi '
      'tiếng nhất châu Âu và thế giới, giành được nhiều danh hiệu quan '
      'trọng như UEFA Champions League và FIFA Club World Cup.',
      target: 'Mục tiêu của Barcelona là xây dựng một đội bóng chất lượng '
      'cao, sở hữu phong cách chơi tấn công sáng tạo và kiểm soát bóng, '
      'giành được danh hiệu trong các giải đấu quốc nội và quốc tế, '
      'phát triển và lưu giữ tài năng trẻ, và truyền cảm hứng cho '
      'người hâm mộ với tinh thần đáng tự hào của câu lạc bộ.',
      players: ['Marc-André ter Stegen', 'Gerard Piqué', 'Lionel Messi'],
    ),
    Club(
      name: 'Real Madrid',
      logo: 'assets/images/real_madrid.png',
      image: 'assets/images/real.jpg',
      stadium: 'Santiago Bernabéu',
      history: 'Real Madrid là một câu lạc bộ bóng đá hàng đầu có trụ sở '
      'tại Madrid, Tây Ban Nha. Được thành lập vào năm 1902, Real Madrid '
      'đã trở thành một trong những đội bóng nổi tiếng và thành công nhất '
      'trong lịch sử bóng đá. Real Madrid đã giành được nhiều danh hiệu '
      'quan trọng.'+'\n'+'Clb này đã giành chức vô địch La Liga, giải đấu cao '
      'nhất của Tây Ban Nha, rất nhiều lần và là đội bóng với số lần vô '
      'địch nhiều nhất trong lịch sử giải đấu này. Họ cũng đã giành được '
      'nhiều lần UEFA Champions League, giải đấu hàng đầu châu Âu, và là '
      'đội bóng duy nhất giành được 13 danh hiệu '
      'Champions League cho đến năm 2021.',
      target: 'Mục tiêu của Real Madrid là trở thành một trong những câu '
      'lạc bộ hàng đầu thế giới, giành được danh hiệu trong cả các giải '
      'đấu quốc nội và quốc tế, xây dựng đội hình mạnh mẽ và tấn công hấp '
      'dẫn, phát triển tài năng trẻ, và mang lại niềm vui và niềm tự hào '
      'cho người hâm mộ trên toàn thế giới.',
      players: ['Thibaut Courtois', 'Sergio Ramos', 'Karim Benzema'],
    )
  ];
  static List<Newspaper> listNewspaper = [
    Newspaper(
        imageNew: Assets.imgNews4,
        tittle: 'Enrique: "Barca chịu nhiều áp lực hơn PSG"',
        content: 'Huấn luyện viên trưởng của Paris Saint-Germain, Luis Enrique '
            'đã giải thích lý do tại sao ông cảm thấy không có nhiều áp lực '
            'khi đối đầu với Barcelona. Gã khổng lồ nước Pháp sẽ bước vào sân '
            'Parc des Princes khi biết rằng lợi thế ở trận lượt đi có thể cực '
            'kỳ quan trọng đối với cơ hội đi tiếp vào vòng bán kết.' + '\n' 'Nhiều '
            'người sẽ coi áp lực là rất lớn đối với một PSG vẫn chưa nếm '
            'trải vinh quang ở Champions League khi bước vào trận đấu. '
            'Tuy nhiên, Luis Enrique rõ ràng có quan điểm khác.'
    ),
    Newspaper(
        imageNew: Assets.imgNews5,
        tittle: 'Chấm dứt tin đồn, Lewandowski ra quyết định cho tương lai',
        content: 'Robert Lewandowski của Barcelona vẫn dồi dào thể lực trong '
            '12 tháng qua, bất chấp những lo ngại ngôi sao người Ba Lan đã'
            ' lớn tuổi. Anh còn một năm nữa trong hợp đồng và sẽ được gia '
            'hạn thêm một mùa giải nếu chơi 50% số trận của Barca trong mùa '
            'giải tiếp theo. Tuy nhiên, Lewandowski đã có sẵn kế hoạch cho '
            'những ngày thi đấu cuối cùng của mình. Theo Sport, tiền đạo sinh '
            'năm 1988 dự định ở lại Barca ngay cả lúc đã treo giày. Lewy giải'
            ' thích với WP SportoweFakty: '
             + '\n' 'Thật khó để dự đoán tôi sẽ làm gì khi kết thúc sự nghiệp, nhưng '
            'Barcelona chắc chắn là thành phố mà chúng tôi sẽ quay trở lại. '
            'Tất nhiên, chúng tôi cũng sẽ đến Warsaw và Ba Lan, vì chúng '
            'tôi có gia đình và bạn bè, nhưng khi có nhiều thời gian hơn, '
            'chúng tôi sẽ quay lại Barcelona. Đó là thành phố mà gia đình '
            'tôi cảm thấy có thể ở lại sau khi sự nghiệp của tôi kết thúc.'
    ),
    Newspaper(
        imageNew: Assets.imgNews6,
        tittle: '"Tôi có ở lại Barca không? Yên tâm, vẫn còn 2 năm hợp đồng"',
        content: 'Trước những chia sẻ của chủ tịch Joan Laporta về việc '
            'Barcelona đã từ chối lời đề nghị trị giá 200 triệu euro dành cho '
            'mình, Lamine Yamal thừa nhận bản thân chỉ tập trung vào việc chơi '
            'bóng. ' + '\n' ' Tài năng người Tây Ban Nha chia sẻ: "Barca đã '
            'từ chối lời đề '
            'nghị 200 triệu euro? Tôi rất mừng vì những nỗ lực của mình được '
            'ghi nhận, nhưng tôi chỉ tập trung vào việc thi đấu. Tôi có ở lại '
            'hay không? Họ có thể yên tâm, hợp đồng vẫn còn 2 năm."'
    ),
    // Newspaper(
    //     imageNew: imageNew,
    //     tittle: tittle,
    //     content: content
    // ),
    // Newspaper(
    //     imageNew: imageNew,
    //     tittle: tittle,
    //     content: content
    // ),
    // Newspaper(
    //     imageNew: imageNew,
    //     tittle: tittle,
    //     content: content
    // ),
  ];
  static List<Schedule> footballSchedules = [
    Schedule(
        team1: 'Liverpool',
        icon1: 'assets/icons/liverpool.png',
        team2: 'Man United',
        icon2: 'assets/icons/manchester_united.png',
        time: '21:00',
        date: '10/04'
    ),
    Schedule(
        team1: 'Chelsea',
        icon1: 'assets/icons/chelsea.png',
        team2: 'Arsenal',
        icon2: 'assets/icons/arsenal.png',
        time: '19:00',
        date: '11/04'
    ),
    Schedule(
        team1: 'Man City',
        icon1: 'assets/icons/manchester_city.png',
        team2: 'Tottenham',
        icon2: 'assets/icons/tottenham.png',
        time: '21:00',
        date: '12/04'
    ),
    Schedule(
        team1: 'Everton',
        icon1: 'assets/icons/everton.png',
        team2: 'Leicester City',
        icon2: 'assets/icons/leicester_city.png',
        time: '18:00',
        date: '13/04'
    ),
    Schedule(
        team1: 'Wolves',
        icon1: 'assets/icons/wolves.png',
        team2: 'Newcastle',
        icon2: 'assets/icons/newcastle.png',
        time: '20:00',
        date: '14/04'
    ),
    Schedule(
        team1: 'Spur',
        icon1: 'assets/icons/southampton.png',
        team2: 'Crystal Palace',
        icon2: 'assets/icons/crystal_palace.png',
        time: '16:00',
        date: '13/04'
    ),
    Schedule(
        team1: 'West Ham',
        icon1: 'assets/icons/west_ham.png',
        team2: 'Aston Villa',
        icon2: 'assets/icons/aston_villa.png',
        time: '18:30',
        date: '15/04'
    ),
    Schedule(
        team1: 'Leeds United',
        icon1: 'assets/icons/leeds_united.png',
        team2: 'Norwich City',
        icon2: 'assets/icons/norwich_city.png',
        time: '17:00',
        date: '15/04'
    ),
    Schedule(
        team1: 'Watford',
        icon1: 'assets/icons/watford.png',
        team2: 'Brighton',
        icon2: 'assets/icons/brighton.png',
        time: '19:45',
        date: '18/04'
    ),
    Schedule(
        team1: 'Fulham',
        icon1: 'assets/icons/fulham.png',
        team2: 'Brentford',
        icon2: 'assets/icons/brentford.png',
        time: '21:00',
        date: '18/04'
    ),
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
  static final List<Player> players = [
    Player(
        name: "Cristiano Ronaldo",
        position: "Tiền đạo",
        jerseyNumber: "7",
        avatarUrl: Assets.imgRonaldo,
        club: 'Real Madrid'),
    Player(
        name: "Lionel Messi",
        position: "Tiền đạo",
        jerseyNumber: "10",
        avatarUrl: Assets.imgMessi,
        club: 'Barcelona'),
    Player(
        name: "Neymar JR",
        position: "Tiền đạo",
        jerseyNumber: "11",
        avatarUrl: Assets.imgNeymar,
        club: 'Barcelona'),
    Player(
        name: "Xavi",
        position: "Tiền vệ",
        jerseyNumber: "6",
        avatarUrl: Assets.imgXavi,
        club: 'Barcelona'),
    Player(
        name: "Andres Iniesta",
        position: "Tiền vệ",
        jerseyNumber: "8",
        avatarUrl: Assets.imgIniesta,
        club: 'Barcelona'),
    Player(
        name: "Mohamed Salah",
        position: "Tiền đạo cánh phải",
        jerseyNumber: "11",
        avatarUrl: Assets.imgSalah,
        club: 'Liverpool',
    ),
    Player(
        name: "Karim Benzema",
        position: "Tiền đạo",
        jerseyNumber: "9",
        avatarUrl: Assets.imgBenzema,
        club: 'Real Madrid',
    ),
    Player(
      name: "Marcus Rashford",
      position: "Tiền đạo cánh",
      jerseyNumber: "10",
      avatarUrl: Assets.imgRashford,
      club: 'Manchester United',
    ),
    Player(
      name: "Virgil van Dijk",
      position: "Trung vệ",
      jerseyNumber: "4",
      avatarUrl: Assets.imgVanDijk,
      club: 'Liverpool',
    ),
    Player(
      name: "Luka Modric",
      position: "Tiền vệ trung tâm",
      jerseyNumber: "10",
      avatarUrl: Assets.imgModric, // Thay thế bằng đường dẫn thực tế trong dự án của bạn
      club: 'Real Madrid',
    ),
  ];
  static final List<ScoreModel> teamDataList1 = [
    ScoreModel(
      position: 1,
      teamName: 'Man United',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 2,
      teamName: 'Liverpool',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 3,
      teamName: 'Arsenal',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 4,
      teamName: 'Man City',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 5,
      teamName: 'Chelsea',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 6,
      teamName: 'Chelsea',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 7,
      teamName: 'Tottenham',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 8,
      teamName: 'Aston Villa',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
  ];
  static final List<ScoreModel> teamDataList2 = [
    ScoreModel(
      position: 1,
      teamName: 'Liverpool',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 2,
      teamName: 'Man United',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 3,
      teamName: 'Arsenal',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 4,
      teamName: 'Man City',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 5,
      teamName: 'Chelsea',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 6,
      teamName: 'Chelsea',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 7,
      teamName: 'Tottenham',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 8,
      teamName: 'Aston Villa',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
  ];
  static final List<ScoreModel> teamDataList3 = [
    ScoreModel(
      position: 1,
      teamName: 'Barcelona',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 2,
      teamName: 'Real Madrid',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 3,
      teamName: 'Valencia',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 4,
      teamName: 'Osasuna',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 5,
      teamName: 'Villarreal',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 6,
      teamName: 'Sevilla',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 7,
      teamName: 'Celta Vigo',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 8,
      teamName: 'Getafe',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
  ];
  static final List<ScoreModel> teamDataList4 = [
    ScoreModel(
      position: 1,
      teamName: 'Barcelona',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 2,
      teamName: 'Real Madrid',
      matchesPlayed: 29,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews,
    ),
    ScoreModel(
      position: 3,
      teamName: 'Valencia',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 4,
      teamName: 'Osasuna',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 5,
      teamName: 'Villarreal',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 6,
      teamName: 'Sevilla',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 7,
      teamName: 'Celta Vigo',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
    ScoreModel(
      position: 8,
      teamName: 'Getafe',
      matchesPlayed: 10,
      wins: 5,
      draws: 3,
      losses: 2,
      goalsFor: 15,
      goalsAgainst: 10,
      avatarUrl: Assets.imgNews2,
    ),
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
