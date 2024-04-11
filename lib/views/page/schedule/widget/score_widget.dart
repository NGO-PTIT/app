import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_option.dart';
import 'package:football_news_app/views/page/statistics/statistics_page.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/assets.dart';
import '../../../../models/schedule_model.dart';
import '../../../common/common_text.dart';

class ScoreWidget extends StatelessWidget {
  final int index;
  final List<Schedule> listSchedule = AppOption.footballSchedules;

  ScoreWidget({
    super.key, required this.index,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn các phần tử theo chiều ngang
            children: [
              // Nhóm bên trái
              Expanded(
                flex: 2, // Cung cấp một trọng số "flex" cho nhóm bên trái
                child: Row(
                  children: [
                    Expanded(
                      child: CommonText(
                          listSchedule[index].date,
                          variant: Variant.small,
                          textColor: AppColors.black
                      ),
                    ),
                    Expanded(
                      child: CommonText(
                          listSchedule[index].team1,
                          variant: Variant.small,
                          textColor: AppColors.black
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(listSchedule[index].icon1),
                    ),
                  ],
                ),
              ),
              // Tỷ số ở giữa
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
                    listSchedule[index].time,
                    textColor: AppColors.black,
                    variant: Variant.small,
                    fontStyle: FontStyle.bold,
                  ),
                ),
              ),
              // Nhóm bên phải
              Expanded(
                flex: 2, // Cung cấp một trọng số "flex" cho nhóm bên phải
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(listSchedule[index].icon2),
                    ),
                    AppConstants.kSpacingItemW24, // Giả định đây là một khoảng cách cố định
                    Expanded(
                      child: CommonText(
                          listSchedule[index].team2,
                          variant: Variant.small,
                          textColor: AppColors.black
                      ),
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
