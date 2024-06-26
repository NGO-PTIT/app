import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_option.dart';
import 'package:football_news_app/views/page/statistics/statistics_page.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/assets.dart';
import '../../../../models/schedule_model.dart';
import '../../../common/common_text.dart';
import '../../statistics/Statistics_before_match.dart';

class ScoreWidget extends StatelessWidget {
  final Schedule schedule;

  ScoreWidget({
    super.key,
    required this.schedule,
  });

  MaterialPageRoute<dynamic> getPageRoute(int check, Schedule schedule) {
    if (check == 3) {
      return MaterialPageRoute(
        builder: (context) => StatisticsPage(
          schedule: schedule,
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => MatchInfoPage(
          schedule: schedule,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          getPageRoute(schedule.time.length, schedule),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2, //
                child: Row(
                  children: [
                    Expanded(
                      child: CommonText(schedule.date.substring(5, 10),
                          variant: Variant.small, textColor: AppColors.black),
                    ),
                    Expanded(
                      child: CommonText(schedule.team1,
                          variant: Variant.small, textColor: AppColors.black),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(schedule.icon1),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: AppColors.gray49E,
                ),
                child: Center(
                  child: CommonText(
                    schedule.time,
                    textColor: AppColors.black,
                    variant: Variant.small,
                    fontStyle: FontStyle.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(schedule.icon2),
                    ),
                    AppConstants.kSpacingItemW24,
                    Expanded(
                      child: CommonText(schedule.team2,
                          variant: Variant.small, textColor: AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
