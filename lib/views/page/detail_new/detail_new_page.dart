import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/views/common/common_text.dart';

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
      appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.emeraldGreen,
          title: const CommonText(
            "Detail New",
            textColor: Colors.white,
            fontStyle: FontStyle.bold,
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
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppConstants.kSpacingItem10,
              Text(
                widget.content,
                textAlign: TextAlign.justify,
              ),
              AppConstants.kSpacingItem8,
              const CommonText(
                'Bình luận',
                textColor: AppColors.black,
                fontStyle: FontStyle.bold,
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
                      AppOption.comments.add(
                        Comment(
                          image: Assets.imgNews,
                          userName: 'User',
                          text: commentController.text,
                        ),
                      );
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
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          AppOption.comments[index].text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
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
