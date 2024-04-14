import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/views/common/common_text.dart';
import 'package:football_news_app/views/page/statistics/widget/developments_widget.dart';
import 'package:football_news_app/views/page/statistics/widget/statistics_widget.dart';
import '../../../models/schedule_model.dart';

class StatisticsPage extends StatefulWidget {
  final Schedule schedule;

  const StatisticsPage({super.key, required this.schedule});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late final Schedule schedule;

  @override
  void initState() {
    super.initState();
    schedule = widget.schedule;
  }

  bool showAllComments = false;
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.green[50],
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.white),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: AppColors.emeraldGreen,
              bottom: const TabBar(
                tabs: [
                  Tab(
                      child: CommonText(
                    'Thống kê',
                    textColor: Colors.white,
                    variant: Variant.mediums,
                    fontStyle: FontStyle.bold,
                  )),
                  Tab(
                      child: CommonText(
                    'Diễn biến',
                    textColor: Colors.white,
                    variant: Variant.mediums,
                    fontStyle: FontStyle.bold,
                  )),
                ],
              ),
              title: const CommonText(
                fontStyle: FontStyle.bold,
                'Statistics',
                textColor: AppColors.white,
                variant: Variant.h6,
              ),
            ),
            body: TabBarView(children: [
              Statistics(
                schedule: schedule,
              ),
              DevelopmentPage(
                schedule: schedule,
              ),
            ])));
  }
}
