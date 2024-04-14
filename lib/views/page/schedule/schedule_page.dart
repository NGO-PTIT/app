import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_news_app/config/constants/app_colors.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/views/common/common_drawer.dart';
import 'package:football_news_app/views/common/common_text.dart';
import 'package:football_news_app/views/page/schedule/widget/score_widget.dart';

class SchedulePage extends StatefulWidget {
  final DateTime _selectedDate = DateTime.now();
  SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late DateTime _selectedDate;
  @override
  void initState() {
    super.initState();
    _selectedDate = widget._selectedDate;
  }
  void _presentDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      // Bạn cần có một hàm để tải lại dữ liệu dựa vào ngày đã chọn.
      _loadScheduleForSelectedDate();
    }
  }
  void _loadScheduleForSelectedDate() {
    // Đây là nơi bạn sẽ lọc hoặc tải lại dữ liệu lịch thi đấu
    // dựa trên _selectedDate và sau đó cập nhật UI.
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
            'Schedule Page',
            textColor: AppColors.white,
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
                        textColor: AppColors.black,
                        variant: Variant.h6,
                        fontStyle: FontStyle.bold,
                      ),
                      Spacer(),
                      _buildDatePickerButton(),
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
                ScoreWidget(
                  index: 0,
                ),
                ScoreWidget(
                  index: 1,
                ),
                ScoreWidget(
                  index: 2,
                ),
                ScoreWidget(
                  index: 3,
                ),
                AppConstants.kSpacingItem8,
                const CommonText(
                  "Primeira League",
                  textColor: AppColors.black,
                  variant: Variant.h7,
                  fontStyle: FontStyle.bold,
                ),
                AppConstants.kSpacingItem8,
                ScoreWidget(
                  index: 4,
                ),
                ScoreWidget(
                  index: 5,
                ),
                ScoreWidget(
                  index: 6,
                ),
                ScoreWidget(
                  index: 9,
                ),
              ],
            ),
          ),
        )
    );
  }
  Widget _buildDatePickerButton() {
    return ElevatedButton(
      onPressed: _presentDatePicker,
      child: Text('Chọn Ngày'),
    );
  }
}


