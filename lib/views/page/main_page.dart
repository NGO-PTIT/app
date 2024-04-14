import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_news_app/config/constants/app_string.dart';
import 'package:football_news_app/views/page/news/news_page.dart';
import 'package:football_news_app/views/page/schedule/schedule_page.dart';
import 'package:football_news_app/views/page/statistics/statistics_page.dart';

import '../../config/constants/app_colors.dart';
import 'club/club_page.dart';
import 'manage_notification/manage_notification_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  static List<Widget> _page = <Widget>[
    NewsPage(),
    SchedulePage(),
    ClubPage(),
    ManageNotificationPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            _selectedIndex = index;
          },
          children: _page,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0
                    ? Icons.article_rounded
                    : Icons.article_outlined,
              ),
              label: AppString.news,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1
                    ? Icons.live_tv_rounded
                    : Icons.live_tv_outlined,
              ),
              label: AppString.schedule,
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Icons.sports_volleyball_rounded
                  : Icons.sports_volleyball_outlined),
              label: AppString.clb,
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.settings_rounded
                  : Icons.settings_outlined),
              label: AppString.setting,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.emeraldGreen,
          unselectedItemColor: AppColors.gray1,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            });
          },
        ));
  }
}
