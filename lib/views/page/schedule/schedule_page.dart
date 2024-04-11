import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/config/constants/assets.dart';
import 'package:football_news_app/views/common/common_drawer.dart';
import 'package:football_news_app/views/common/common_text.dart';
import 'package:football_news_app/views/page/schedule/widget/score_widget.dart';
import 'package:football_news_app/views/page/statistics/widget/score_board_widget.dart';

import '../../../config/constants/app_option.dart';
import '../../../models/comment_model.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.gray49E,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.emeraldGreen,
          title: const CommonText(
            fontStyle: FontStyle.bold,
            'Schedule Page',
            textColor: AppColors.white,
            variant: Variant.h6,
          ),
        ),
        drawer: const CommonDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
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
                        'Lịch sử thi đấu',
                        textColor: AppColors.black,
                        variant: Variant.h6,
                        fontStyle: FontStyle.bold,
                      ),
                    ],
                  ),
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "Primeira League",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ScoreWidget(index: 0,),
                ScoreWidget(index: 1,),
                ScoreWidget(index: 2,),
                ScoreWidget(index: 3,),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "Primeira League",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ScoreWidget(index: 4,),
                ScoreWidget(index: 5,),
                ScoreWidget(index: 6,),
              ],
            ),
          ),
        ));
  }
}
