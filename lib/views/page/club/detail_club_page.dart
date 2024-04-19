import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_news_app/views/common/common_text.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_constants.dart';
import '../../../models/player_model.dart';
import '../../../models/score_model.dart';
import '../../../models/club_model.dart';
import 'package:http/http.dart' as http;

class DetailClubPage extends StatefulWidget {
  final Club club;
  const DetailClubPage({
    super.key,
    required this.club,
  });

  @override
  State<DetailClubPage> createState() => _DetailClubPageState();
}

class _DetailClubPageState extends State<DetailClubPage> {

  List<Player> listPlayers = [];
  List<Score> listScores = [];
  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/allplayer'));
    final response2 = await http.get(Uri.parse('http://10.0.2.2:8080/api/allscore'));

    if (response.statusCode == 200 && response2.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        List<dynamic> jsonData2 = json.decode(response2.body);
        listPlayers = jsonData.map<Player>((json) => Player.fromJson(json)).toList();
        listScores = jsonData2.map<Score>((json) => Score.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load players');
    }
  }
  @override
  Widget build(BuildContext context) {
    List<Score> currentTeamDataList = [];
    for(Score score in listScores){
      if(score.tournament.compareTo(widget.club.tournament)==0){
        currentTeamDataList.add(score);
      }
    }
    List<Player> listPlayer = getPlayer(widget.club.name, listPlayers);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.white),
            backgroundColor: AppColors.emeraldGreen,
            bottom: const TabBar(
              tabs: [
                Tab(
                    child: CommonText(
                  'Tổng quan',
                  textColor: Colors.white,
                  variant: Variant.mediums,
                  fontStyle: FontStyle.bold,
                )),
                Tab(
                    child: CommonText(
                  'Thứ hạng',
                  textColor: Colors.white,
                  variant: Variant.mediums,
                  fontStyle: FontStyle.bold,
                )),
                Tab(
                    child: CommonText(
                  'Cầu thủ',
                  textColor: Colors.white,
                  variant: Variant.mediums,
                  fontStyle: FontStyle.bold,
                )),
                Tab(
                    child: CommonText(
                  'Tiểu sử',
                  textColor: Colors.white,
                  variant: Variant.mediums,
                  fontStyle: FontStyle.bold,
                )),
              ],
            ),
            title: CommonText(
              widget.club.name,
              textColor: Colors.white,
              fontStyle: FontStyle.bold,
              variant: Variant.h6,
            )),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                              widget.club.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    AppConstants.kSpacingItem20,
                    Text(
                      'Câu lạc bộ ${widget.club.name}',
                      style:
                          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    AppConstants.kSpacingItem10,
                    const Text(
                      'Về chúng tôi',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    AppConstants.kSpacingItem10,
                    Text(
                      widget.club.history,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    AppConstants.kSpacingItem20,
                    const Text(
                      'Mục tiêu',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    AppConstants.kSpacingItem10,
                    Text(
                      widget.club.target,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      DataTable(
                        columnSpacing: 24,
                        columns: const [
                          DataColumn(label: Text('TT')),
                          DataColumn(label: Text('Đội')),
                          DataColumn(label: Text('ST')),
                          DataColumn(label: Text('T')),
                          DataColumn(label: Text('H')),
                          DataColumn(label: Text('B')),
                          DataColumn(label: Text('HS')),
                          DataColumn(label: Text('Đ')),
                        ],
                        rows: currentTeamDataList.map((teamData) {
                          return DataRow(cells: [
                            DataCell(Text('${teamData.position}')),
                            DataCell(
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                    AssetImage(teamData.avatarUrl),
                                  ),
                                  SizedBox(width: 8),
                                  Text(teamData.teamName),
                                ],
                              ),
                            ),
                            DataCell(Text('${teamData.matchesPlayed}')),
                            DataCell(Text('${teamData.wins}')),
                            DataCell(Text('${teamData.draws}')),
                            DataCell(Text('${teamData.losses}')),
                            DataCell(Text('${teamData.goalsFor-teamData.goalsAgainst}')),
                            DataCell(Text('${teamData.point}')),
                          ]);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: listPlayer.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          AssetImage(listPlayer[index].avatarUrl),
                        ),
                        title: Text(listPlayer[index].name),
                        trailing: Text(listPlayer[index].position),
                        subtitle: Text(
                            'Số áo: ${listPlayer[index].jerseyNumber}'),
                        onTap: () {
                          // Xử lý sự kiện khi bấm vào một cầu thủ
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                            widget.club.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    AppConstants.kSpacingItem20,
                    Text(
                      'Lịch sử của ${widget.club.name}',
                      style:
                          const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                    ),
                    AppConstants.kSpacingItem10,
                    AppConstants.kSpacingItem10,
                    Text(
                      widget.club.history,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Player> getPlayer(String club, List<Player> listPlayers){
  List<Player> listPlayer = [];
  for (var player in listPlayers){
    if(player.club == club) {
      listPlayer.add(player);
    }
  }
  return listPlayer;
}