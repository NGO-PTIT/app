import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/config/constants/assets.dart';
import 'package:football_news_app/views/common/common_drawer.dart';
import 'package:football_news_app/views/common/common_text.dart';
import 'package:football_news_app/views/page/statistics/widget/score_board_widget.dart';

import '../../../config/constants/app_option.dart';
import '../../../models/comment_model.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  bool showAllComments = false;
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.emeraldGreen,
          title: const CommonText(
            fontStyle: FontStyle.bold,
            'Statistics',
            textColor: AppColors.white,
            variant: Variant.h6,
          ),
        ),
        body: SingleChildScrollView(
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
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(Assets.imgNews2),
                    ),
                    AppConstants.kSpacingItemW8,
                    CommonText('Man United'),
                    Spacer(),
                    CommonText('Man City'),
                    AppConstants.kSpacingItemW8,
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(Assets.imgNews3),
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
                                const CommonText(
                                  '1',
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
                            left: MediaQuery.of(context).size.width * 0.35,
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
                              const CommonText(
                                '4',
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ScoreBoardWidget();
                  },
                ),
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
            ),
          ),
        ));
  }
}
