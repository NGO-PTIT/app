import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:football_news_app/views/common/common_drawer.dart';
import 'package:football_news_app/views/common/common_text.dart';

import '../../../models/new_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Newspaper> listNews = [];
  @override
  void initState() {
    super.initState();
    fetchNews();
  }
  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/allnews'));

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        listNews = jsonData.map<Newspaper>((json) => Newspaper.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load news');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.emeraldGreen,
          title: const CommonText(
            fontStyle: FontStyle.bold,
            'News',
            textColor: AppColors.white,
            variant: Variant.h6,
          ),
        ),
        drawer: const CommonDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                        Icons.home_outlined,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  AppConstants.kSpacingItemW8,
                  const CommonText(
                    'Tin tức',
                    textColor: AppColors.black,
                    variant: Variant.h6,
                    fontStyle: FontStyle.bold,
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: listNews.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            index == 0 ?
                            VIteamNew(
                              new1:listNews[0]
                            ) :HIteamNew(
                                new1:listNews[index]
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class VIteamNew extends StatelessWidget {
  final Newspaper new1;
  const VIteamNew({
    super.key,
    required this.new1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/news_detail', arguments: {
          'image': new1.image,
          'title': new1.title,
          'content': new1.content,
        });
      },
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(
                  new1.image
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  new1.title,
                  textColor: AppColors.black,
                  variant: Variant.h6,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  '28 phút trước',
                  textColor: AppColors.black,
                  variant: Variant.h6,
                  fontStyle: FontStyle.regular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HIteamNew extends StatelessWidget {
  final Newspaper new1;
  const HIteamNew({
    super.key,
    required this.new1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/news_detail', arguments: {
          'image': new1.image,
          'title': new1.title,
          'content': new1.content,
        });
      },
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(new1.image),
                fit: BoxFit.cover,
              ),
            ),
            height: 100,
          ),
          AppConstants.kSpacingItemW8,
          Flexible(
            child: CommonText(
              new1.title,
              textColor: AppColors.black,
              variant: Variant.h6,
              fontStyle: FontStyle.bold,
              style: TextStyle(),
            ),
          ),
        ],
      )
    );
  }
}
