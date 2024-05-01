import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_news_app/models/statistical_model.dart';
import 'package:football_news_app/views/page/statistics/widget/match_stats_widget.dart';
import 'package:provider/provider.dart';

import '../../../../ThemeProvider.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../config/constants/app_option.dart';
import '../../../../config/constants/assets.dart';
import '../../../../models/schedule_model.dart';
import '../../../common/common_text.dart';
import '../../../../models/comment_model.dart';
import 'package:flutter/widgets.dart';

class Statistics extends StatefulWidget {
  late final Schedule schedule;

  Statistics({super.key, required this.schedule});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late final Schedule schedule;
  List<Comment> allComments = [];
  List<Comment> listComments = [];
  List<MatchStats> listMatchStats = [];

  @override
  void initState() {
    super.initState();
    schedule = widget.schedule;
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/api/allcomment'));
    final response2 =
    await http.get(Uri.parse('http://10.0.2.2:8080/api/allMatchStats'));

    if (response.statusCode == 200 && response2.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        allComments =
            jsonData.map<Comment>((json) => Comment.fromJson(json)).toList();
        for (Comment cm in allComments) {
          if (cm.id.compareTo(widget.schedule.infor) == 0) {
            listComments.add(cm);
          }
        }
        List<dynamic> jsonData2 = json.decode(response2.body);
        listMatchStats =
            jsonData2.map<MatchStats>((json) => MatchStats.fromJson(json)).toList();
        print('Ok');
        print(listMatchStats.length);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var random = Random();
    int randomNumber = random.nextInt(5);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.emeraldGreen,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.bar_chart_outlined,
                      color: AppColors.white,
                      size: 30,
                    ),
                  ),
                ),
                AppConstants.kSpacingItemW8,
                const CommonText(
                  'Thống kê',
                  textColor: AppColors.black,
                  variant: Variant.h6,
                  fontStyle: FontStyle.bold,
                ),
              ],
            ),
            AppConstants.kSpacingItem8,
            Container(
              color: AppColors.emeraldGreen,
              height: 0.2,
            ),
            AppConstants.kSpacingItem8,
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(schedule.icon1),
                ),
                AppConstants.kSpacingItemW8,
                CommonText(schedule.team1),
                Spacer(),
                CommonText(schedule.team2),
                AppConstants.kSpacingItemW8,
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(schedule.icon2),
                ),
                AppConstants.kSpacingItemW8,
              ],
            ),
            AppConstants.kSpacingItem24,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 290,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            bottomLeft: Radius.circular(4.0),
                          ),
                          color: AppColors.emeraldGreen,
                        ),
                        child: Row(
                          children: [
                            AppConstants.kSpacingItemW24,
                            CommonText(
                              '${listMatchStats[randomNumber].possession1}%',
                              textColor: AppColors.white,
                              variant: Variant.h6,
                              fontStyle: FontStyle.bold,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 6,
                        left: MediaQuery.of(context).size.width * 0.3,
                        child: const Column(
                          children: [
                            CommonText(
                              'Kiểm soát bảng',
                              textColor: AppColors.white,
                              variant: Variant.h7,
                              fontStyle: FontStyle.bold,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4.0),
                          bottomRight: Radius.circular(4.0),
                        ),
                        color: AppColors.oliveGreen,
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          CommonText(
                            '${listMatchStats[randomNumber].possession2}%',
                            textColor: AppColors.white,
                            variant: Variant.h6,
                            fontStyle: FontStyle.bold,
                          ),
                          AppConstants.kSpacingItemW24,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppConstants.kSpacingItem16,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return ScoreBoardWidget(matchStats: listMatchStats[randomNumber],);
              },
            ),
            AppConstants.kSpacingItem16,
            TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Nhập bình luận',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            AppConstants.kSpacingItem8,
            ElevatedButton(
              onPressed: () {
                setState(() async {
                  final response = await http.post(
                    Uri.parse('http://10.0.2.2:8080/api/saveComment'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      'userName': AppOption.user[1].email,
                      'text': commentController.text.trim(),
                      'image': Assets.imgNews,
                      'id': widget.schedule.infor,
                    }),
                  );
                  if (response.body.contains('ok')) {
                    Comment newComment = Comment(
                      userName: AppOption.user[1].email,
                      text: commentController.text.trim(),
                      image: Assets.imgNews,
                      id: widget.schedule.infor,
                    );
                    setState(() {
                      listComments.insert(0, newComment);
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Thông báo'),
                        content: const Text('Bình luận thành công'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Lỗi'),
                        content: const Text('Lỗi chưa xác định, bình luận lại'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                });
                commentController.clear();
              },
              child: const CommonText(
                'Gửi',
                textColor: AppColors.emeraldGreen,
                fontStyle: FontStyle.bold,
              ),
            ),
            AppConstants.kSpacingItem8,
            const CommonText(
              'Bình luận gần đây',
              textColor: AppColors.black,
              fontStyle: FontStyle.bold,
            ),
            AppConstants.kSpacingItem8,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listComments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(listComments[index].image),
                  ),
                  title: Text(
                    listComments[index].userName,
                    style: TextStyle(
                      fontSize:
                          Provider.of<ThemeProvider>(context).fontSize + 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    style: TextStyle(
                      fontSize: Provider.of<ThemeProvider>(context).fontSize,
                      color: Colors.black,
                    ),
                    listComments[index].text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
