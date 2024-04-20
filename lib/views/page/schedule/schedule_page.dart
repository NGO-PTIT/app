import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/views/common/common_drawer.dart';
import 'package:football_news_app/views/common/common_text.dart';
import 'package:football_news_app/views/page/schedule/widget/score_widget.dart';
import 'package:http/http.dart' as http;

import '../../../models/schedule_model.dart';

class SchedulePage extends StatefulWidget {
  final DateTime _selectedDate = DateTime.now();

  SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late DateTime _selectedDate;
  late Schedule schedule;
  List<Schedule> listSchedules = [];
  List<Schedule> listSchedulesNHA = [];
  List<Schedule> listSchedulesLALIGA = [];
  List<Schedule> listSchedulesSERIA = [];
  List<Schedule> listSchedulesBUNDES = [];
  List<Schedule> listSchedulesC1 = [];
  final List<Schedule> _filteredSchedule = [];
  int showL = 0;

  @override
  void initState() {
    super.initState();
    fetchSchedules();
    _selectedDate = widget._selectedDate;
  }

  Future<void> fetchSchedules() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/api/allschedule'));

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        listSchedules =
            jsonData.map<Schedule>((json) => Schedule.fromJson(json)).toList();
        _presentDatePicker();
        showL = 1;
      });
    } else {
      throw Exception('Failed to load Schedule');
    }
  }

  void _presentDatePicker() async {
    late final DateTime? picked;
    if (showL == 0) {
      picked = _selectedDate;
    } else {
      picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
    }
    if (picked != null) {
      String formattedPickedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        _selectedDate = picked!;
        _filteredSchedule.clear();
        listSchedulesNHA.clear();
        listSchedulesC1.clear();
        listSchedulesLALIGA.clear();
        listSchedulesBUNDES.clear();
        listSchedulesSERIA.clear();
      });
      for (Schedule schedule in listSchedules) {
        if (schedule.date.contains(formattedPickedDate.toString()) == true) {
          _filteredSchedule.add(schedule);
          switch (schedule.tournament) {
            case 'Premier League':
              listSchedulesNHA.add(schedule);
              break;
            case 'Bundesliga':
              listSchedulesBUNDES.add(schedule);
              break;
            case 'La Liga':
              listSchedulesLALIGA.add(schedule);
              break;
            case 'Serie A':
              listSchedulesSERIA.add(schedule);
              break;
            case 'UEFA Champions League':
              listSchedulesC1.add(schedule);
              break;
            default:
              print('Unknown command.');
          }
        }
      }
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
            'Schedule Page',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            variant: Variant.h6,
          ),
        ),
        drawer: const CommonDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        variant: Variant.h6,
                      ),
                      Spacer(),
                      _buildDatePickerButton(),
                    ],
                  ),
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "UEFA Champions League",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listSchedulesC1.length,
                  itemBuilder: (context, index) {
                    var schedule = listSchedulesC1[index];
                    return ScoreWidget(
                      schedule: schedule,
                    );
                  },
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "Premier League",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listSchedulesNHA.length,
                  itemBuilder: (context, index) {
                    var schedule = listSchedulesNHA[index];
                    return ScoreWidget(
                      schedule: schedule,
                    );
                  },
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "La liga",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listSchedulesLALIGA.length,
                  itemBuilder: (context, index) {
                    var schedule = listSchedulesLALIGA[index];
                    return ScoreWidget(
                      schedule: schedule,
                    );
                  },
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "Serie A",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listSchedulesSERIA.length,
                  itemBuilder: (context, index) {
                    var schedule = listSchedulesSERIA[index];
                    return ScoreWidget(
                      schedule: schedule,
                    );
                  },
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "Bundesliga",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listSchedulesBUNDES.length,
                  itemBuilder: (context, index) {
                    var schedule = listSchedulesBUNDES[index];
                    return ScoreWidget(
                      schedule: schedule,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildDatePickerButton() {
    return ElevatedButton(
      onPressed: _presentDatePicker,
      child: const Text(
        'Chọn Ngày',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
