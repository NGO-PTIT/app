import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/views/common/common_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool showAllComments = false;
  TextEditingController commentController = TextEditingController();

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
                      setState(() {
                        AppOption.comments.add(
                          Comment(
                            image: Assets.imgNews,
                            userName: AppOption.user[1].email,
                            text: commentController.text.trim(),
                          ),
                        );
                      });
                      commentController.clear();
                    },
                    child: CommonText(
                      'Gửi',
                      style: TextStyle(
                        fontSize: Provider.of<ThemeProvider>(context).fontSize + 3,
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
                      fontSize: Provider.of<ThemeProvider>(context).fontSize + 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppConstants.kSpacingItem8,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: showAllComments ? AppOption.comments.length : 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage(AppOption.comments[index].image),
                        ),
                        title: Text(
                          AppOption.comments[index].userName,
                          style: TextStyle(
                            fontSize: Provider.of<ThemeProvider>(context).fontSize + 3,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          style: TextStyle(
                            fontSize: Provider.of<ThemeProvider>(context).fontSize,
                            color: Colors.black,
                          ),
                          AppOption.comments[index].text,
                        ),
                      );
                    },
                  ),
                  AppConstants.kSpacingItem8,
                  if (!showAllComments && AppOption.comments.length > 3)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // TODO: BAD PERFORMANCE, WAIT API
                            setState(() {
                              showAllComments = true;
                            });
                          },
                          child: Text("Xem thêm"),
                        ),
                      ],
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
