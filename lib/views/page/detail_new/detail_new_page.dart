import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/views/common/common_text.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../ThemeProvider.dart';
import '../../../config/constants/app_option.dart';
import '../../../config/constants/assets.dart';
import '../../../models/comment_model.dart';

class DetailNewPage extends StatefulWidget {
  final String image;
  final String title;
  final String content;

  const DetailNewPage({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });

  @override
  State<DetailNewPage> createState() => _DetailNewPageState();
}

class _DetailNewPageState extends State<DetailNewPage> {
  TextEditingController commentController = TextEditingController();
  List<Comment> allComments = [];
  List<Comment> listComments = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/api/allcomment'));

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        allComments =
            jsonData.map<Comment>((json) => Comment.fromJson(json)).toList();
        for (Comment cm in allComments) {
          if (cm.id.compareTo(widget.title) == 0) {
            listComments.add(cm);
          }
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.emeraldGreen,
          title: CommonText(
            "Detail New",
            style: TextStyle(
              fontSize: Provider.of<ThemeProvider>(context).fontSize + 5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppConstants.kSpacingItem10,
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: Provider.of<ThemeProvider>(context).fontSize + 5,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              AppConstants.kSpacingItem10,
              Text(
                widget.content,
                style: TextStyle(
                  fontSize: Provider.of<ThemeProvider>(context).fontSize,
                ),
                textAlign: TextAlign.justify,
              ),
              AppConstants.kSpacingItem8,
              CommonText(
                'Bình luận',
                textColor: AppColors.black,
                style: TextStyle(
                  fontSize: Provider.of<ThemeProvider>(context).fontSize + 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppConstants.kSpacingItem8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            'id': widget.title,
                          }),
                        );
                        if (response.body.contains('ok')) {
                          Comment newComment = Comment(
                            userName: AppOption.user[1].email,
                            text: commentController.text.trim(),
                            image: Assets.imgNews,
                            id: widget.title,
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
                              content: const Text(
                                  'Lỗi chưa xác định, bình luận lại'),
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
                    child: CommonText(
                      'Gửi',
                      style: TextStyle(
                        fontSize:
                            Provider.of<ThemeProvider>(context).fontSize + 3,
                        fontWeight: FontWeight.bold,
                        color: AppColors.emeraldGreen,
                      ),
                    ),
                  ),
                  AppConstants.kSpacingItem8,
                  CommonText(
                    'Bình luận gần đây',
                    textColor: AppColors.black,
                    style: TextStyle(
                      fontSize:
                          Provider.of<ThemeProvider>(context).fontSize + 3,
                      fontWeight: FontWeight.bold,
                    ),
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
                          backgroundImage:
                              AssetImage(listComments[index].image),
                        ),
                        title: Text(
                          listComments[index].userName,
                          style: TextStyle(
                            fontSize:
                                Provider.of<ThemeProvider>(context).fontSize +
                                    3,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          style: TextStyle(
                            fontSize:
                                Provider.of<ThemeProvider>(context).fontSize,
                            color: Colors.black,
                          ),
                          listComments[index].text,
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
