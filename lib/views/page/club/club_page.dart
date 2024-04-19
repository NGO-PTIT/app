import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_constants.dart';

import '../../../config/constants/app_colors.dart';
import '../../../models/club_model.dart';
import '../../common/common_drawer.dart';
import '../../common/common_text.dart';
import 'detail_club_page.dart';
import 'package:http/http.dart' as http;

class ClubPage extends StatefulWidget {
  const ClubPage({Key? key}) : super(key: key);

  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  TextEditingController _searchController = TextEditingController();
  List<Club> listClubs = [];

  final List<Club> _filteredClubs = [];

  @override
  void initState() {
    super.initState();
    fetchClubs();
  }
  Future<void> fetchClubs() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/allclub'));

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        listClubs = jsonData.map<Club>((json) => Club.fromJson(json)).toList();
        _filteredClubs.addAll(listClubs);
      });
    } else {
      throw Exception('Failed to load club');
    }
  }

  void _filterClubs(String query) {
    _filteredClubs.clear();
    if (query.isNotEmpty) {
      for (var club in listClubs) {
        if (club.name.toLowerCase().contains(query.toLowerCase())) {
          _filteredClubs.add(club);
        }
      }
    } else {
      _filteredClubs.addAll(listClubs);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.emeraldGreen,
        title: const CommonText(
          'Câu lạc bộ',
          textColor: AppColors.white,
          variant: Variant.h6,
        ),
      ),
      drawer: const CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CommonText(
              'Chọn câu lạc bộ',
              textColor: AppColors.black,
              variant: Variant.h6,
              fontStyle: FontStyle.bold,
            ),
            AppConstants.kSpacingItem16,
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterClubs,
                      decoration: const InputDecoration(
                        hintText: 'Tìm kiếm câu lạc bộ',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 14.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AppConstants.kSpacingItem16,
            Expanded(
              child: ListView.builder(
                itemCount: _filteredClubs.length,
                itemBuilder: (context, index) {
                  var club = _filteredClubs[index];
                  return ListTile(
                    title: CommonText(
                      club.name,
                      textColor: AppColors.black,
                      variant: Variant.h6,
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(club.logo),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailClubPage(
                            club: club,
                          )
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
